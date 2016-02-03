$("#save_button").prop("disabled",true);

var ProfileTest = React.createClass({
  getInitialState: function() {
    return {save_needed: false,
            bio: this.props.bio,
            sports: this.props.sports,
            activityBlurbs: this.props.activity_blurbs,
            first_name: this.props.user.first_name,
            age: this.props.user.age,
            search_sports: false};
  },
  onClick: function() {
    this.setState({ name_form: true});
  },
  updateBio: function(new_bio){
    this.setState({bio: new_bio});
  },
  updateName: function(first_name){
    this.setState({first_name: first_name})
  },
  updateAge: function(age){
    this.setState({age: age})
  },
  updateSaveNeeded: function() {
      this.setState({save_needed: true});
      $('#save_button').prop("disabled", false);
      $('#save_button').addClass('highlight');
      $("#save_button").prop("disabled",false);
  },
  saveForm: function(){
    $.post( '/users' + this.props.user.id,
            {first_name: this.state.first_name, age: this.state.age, bio: this.state.bio},
            function() {
        console.log('successful update')
      });
  },
  openChooseSportsDialog: function() {
    this.setState({search_sports: true});
  },
  closeSearch: function(chosenSport, activity_blurb_object) {
    this.appendSport(chosenSport, activity_blurb_object);
    this.setState({search_sports: false});
  },
  appendSport: function(chosenSport, activity_blurb_object) {
    var newSportsArray = this.state.sports.slice();
    newSportsArray.push(chosenSport);
    var newActivityBlurbsArray = this.state.activityBlurbs.slice();
    newActivityBlurbsArray.push(activity_blurb_object);
    this.updateSaveNeeded();
    this.setState({sports: newSportsArray, activityBlurbs: newActivityBlurbsArray});
  },
  render: function() {
    return(
      <div>
          <SearchSports search_sports={this.state.search_sports} user={this.props.user} sports={this.props.all_sports} closeSearch={this.closeSearch} />
        <form>
         <img className="profile_pic" src={this.props.user.profile_picture_url} alt="Profile Picture" />
         <p className="profile-text name-age">
           <Name updateName={this.updateName} first_name={this.state.first_name} changeToSave={this.updateSaveNeeded} />, <Age updateAge={this.updateAge} age={this.state.age} changeToSave={this.updateSaveNeeded}/>
         </p>
         <p id="profile_text" className="profile-text">
         <Bio updateBio={this.updateBio} bio={this.state.bio} changeToSave={this.updateSaveNeeded}/>
         </p>
         <Sports sports={this.state.sports} activityBlurbs={this.state.activityBlurbs} changeToSave={this.updateSaveNeeded} add_sport={this.openChooseSportsDialog}/>
       </form>
       <div className="footer">
        <button className="col-xs-6">Logout</button>
        <SaveButton />
        </div>
      </div>
      )
  }
})

var Sports = React.createClass({
  handleClick: function(event) {
    this.props.add_sport();
  },
  deleteSport: function() {

  },
  render: function() {
    if (this.props.sports.length > 0) {
      return(
        <div>
        <div className="sport-button-container">
          {this.props.sports.map(function(sport, i) {
              var sportClass
              console.log('blurbs' + this.props.activityBlurbs.length);
              console.log('sports' + this.props.sports.length);
              switch(this.props.activityBlurbs[i].text) {
                case 'beginner':
                  sportClass = "sports-beginner sports"
                  break;
                case 'advanced':
                  sportClass = 'sports-advanced sports'
                  break;
                default:
                  sportClass = 'sports-intermediate sports'
                  break;
              }

              return (
                <div type="button" className={sportClass} key={i} name={sport.id}>{sport.name}</div>
                );
              }, this)}
          </div>
            <a id="add_sports" href="#" onClick={this.handleClick}>
              <div className="add_sport">
                <span className="fa fa-plus-circle"></span>
              </div>
            </a>
        </div>
      )} else {
        return(
          <div>
            <a id="add_sports" href="#" onClick={this.handleClick}>
              <div className="add_sport">
                <span className="fa fa-plus-circle"></span>
              </div>
            </a>
          <div className="add_sports_helper">
            <span className="glyphicon glyphicon-hand-left"></span>
            <span>Add some sports!</span>
          </div>
        </div>
      )}
  },
})


var Name = React.createClass({
  getInitialState: function() {
    return { form: false,
              first_name: this.props.first_name,
              size: this.props.first_name.length};
  },
  onClick: function() {
    var current_form = this.state.form
    this.setState({ form: !current_form});
    console.log('click')
  },
  handleChange: function() {
    this.setState({first_name: this.refs.first_name.value, size: this.refs.first_name.value.length});
    this.props.updateName(this.refs.first_name.value)
    this.props.changeToSave();
  },
  render: function() {
    if (this.state.form) {
      return(
          <input type="text" autoFocus ref="first_name" id='first_name' size={this.state.size} onChange={this.handleChange} value={this.state.first_name}></input>
        );
        } else {
          return(<span id='first_name' onClick={this.onClick} >{this.state.first_name}</span>);
        }
  }
})

var Age = React.createClass({
  getInitialState: function() {
    return { form: false,
              age: this.props.age,
              size: 2};
  },
  onClick: function() {
    var current_form = this.state.form
    this.setState({ form: !current_form});
    console.log('click')
  },
  handleChange: function() {
    this.setState({age: event.target.value});
    this.props.updateName(this.refs.age.value)
    this.props.changeToSave();
  },
  render: function() {
    if (this.state.form) {
      return(
          <input type="text" autoFocus ref="age" id='age' size={this.state.size} onChange={this.handleChange} value={this.state.age}></input>
        );
        } else {
          return(<span id='age' onClick={this.onClick}>{this.state.age}</span>);
        }
  }
})

var Bio = React.createClass({
  getInitialState: function() {
    return { form: false,
              bio: this.props.bio,
              color_class: 'has-error',
            };
  },
  onClick: function() {
    var current_form = this.state.form
    this.setState({ form: !current_form});
  },
  handleChange: function(event) {
    this.setState({bio: event.target.value});
    if (event.target.value.length > 5) {
      this.setState({color_class: ''});
      this.props.updateBio(event.target.value);
      this.props.changeToSave();
    } else {
      this.setState({color_class: 'has-error'})
    };
  },
  render: function() {
    if (this.state.form) {
      return(
        <div>
          <textarea autoFocus className="form-control" id='bio' rows="4" columns="20" onChange={this.handleChange(this)} value={this.state.bio}></textarea>
        </div>
        );
        } else if (!this.props.bio){
          return(
            <div className={this.state.color_class}>
              <textarea autoFocus className="form-control" id='bio' rows="4" columns="20" onChange={this.handleChange} value={this.state.bio} placeholder="I played varsity tennis in high school in Houston, and moved to SF after college in 2010...">
              </textarea>
            </div>
          );
        } else {
          return(<span id='bio' onClick={this.onClick} >{this.state.bio}</span>);
        }
  }
})

var SearchSports = React.createClass({
  getInitialState: function() {
    return { renderPartial: false };
  },
  render: function() {
    if (this.props.search_sports){
      return(
        <div>
          <hr />
            <PickSports user={this.props.user} sports={this.props.sports} closeSearch={this.props.closeSearch} />
          <hr />
        </div>
        )
    } else {
      return(null)
    }
  }
});

var SaveButton = React.createClass({
  getInitialState: function() {
  render: (
    <input type="submit" name="/edit_profile" ref="save_button" id="save_button" className="col-xs-6" value="Save Changes"></input>
    )
  }
});


// Save disabled until able to save
// Save grabs everything and sends an update

