
var ProfileTest = React.createClass({
  getInitialState: function() {
    return {save_needed: false,
            bio: this.props.user.bio,
            sports: this.props.sports,
            first_name: this.props.user.first_name,
            age: this.props.user.age};
  },
  onClick: function() {
    this.setState({ name_form: true});
  },
  updateSaveNeeded: function() {
    console.log('Save Needed');
  },
  render: function() {
    return(
      <div>
        <form>
         <img className="profile_pic" src={this.props.user.profile_picture_url} alt="Profile Picture" />
         <p className="profile-text name-age">
           <Name first_name={this.state.first_name} changeToSave={this.updateSaveNeeded} />, <Age age={this.state.age} changeToSave={this.updateSaveNeeded}/>
         </p>
         <p id="profile_text" className="profile-text">
         <Bio bio={this.state.bio} changeToSave={this.updateSaveNeeded}/>
         </p>
         <Sports sports={this.state.sports} activity_blurbs={this.props.activity_blurbs} changeToSave={this.updateSaveNeeded}/>
       </form>
      </div>
      )
  }
})

var Sports = React.createClass({
  render: function() {
    if (this.props.sports.length > 0) {
      return(
        <div>
        <div className="sport-button-container">
          {this.props.sports.map(function(sport, i) {
              var sportClass
              switch(this.props.activity_blurbs[i].text) {
                case 'beginner':
                  sportClass = "sports-beginner sports"
                  break;
                case 'intermediate':
                  sportClass = 'sports-intermediate sports'
                  break;
                case 'advanced':
                  sportClass = 'sports-advanced sports'
                  break;
              }

              return (
                <div type="button" className={sportClass} key={i}>{sport.name}</div>
                );
              }, this)}
          </div>
            <a href="#">
              <div className="add_sport">
                <span className="fa fa-plus-circle"></span>
              </div>
            </a>
        </div>
      )} else {
        return(
          <div>
          <a href="#">
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
  },
  render: function() {
    if (this.state.form) {
      return(
          <input type="text" ref="first_name" id='first_name' size={this.state.size} onChange={this.handleChange} value={this.state.first_name}></input>
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
  },
  render: function() {
    if (this.state.form) {
      return(
          <input type="text" ref="age" id='age' size={this.state.size} onChange={this.handleChange} value={this.state.age}></input>
        );
        } else {
          return(<span id='age' onClick={this.onClick}>{this.state.age}</span>);
        }
  }
})

var Bio = React.createClass({
  getInitialState: function() {
    return { form: false, bio: this.props.bio};
  },
  onClick: function() {
    var current_form = this.state.form
    this.setState({ form: !current_form});
    console.log('click')
  },
  handleChange: function() {
    this.setState({bio: event.target.value});
    this.props.changeToSave();
  },
  render: function() {
    if (this.state.form) {
      return(
        <div>
          <textarea className="form-control" id='bio' rows="4" columns="20" onChange={this.handleChange} value={this.state.bio}></textarea>
        </div>
        );
        } else if (!this.props.bio){
          return(
            <div className="form-group has-error">
              <textarea className="form-control" id='bio' rows="4" columns="20" onChange={this.handleChange} value={this.state.bio} placeholder="Please write your profile information here!">
              </textarea>
            </div>
          );
        } else {
          return(<span id='bio' onClick={this.onClick} >{this.state.bio}</span>);
        }
  }
})


// Save disabled until able to save, turn green
// Save grabs everything and sends an update
// Sports are also sent at this time?
