
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
    // If state has changed and the requirements are met, show save button
  },
  render: function() {
    return(
      <div className="row">
        <form>
         <img className="profile_pic" src={this.props.user.profile_picture_url} alt="Profile Picture" />
         <p className="profile-text name-age">
           <Name first_name={this.state.first_name} />, <Age age={this.state.age} />
         </p>
         <p id="profile_text" className="profile-text">
         <Bio bio={this.state.bio} />
         </p>
         <Sports sports={this.state.sports}/>
         <Save done={this.state.done}/>
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
          <ul>
          {this.props.sports.map(function(sport, i) {
              var sportClass
              switch(sport.name) {
                case 'beginner':
                  sportClass = 'sports-beginner sports'
                  break;
                case 'intermediate':
                  sportClass = 'sports-intermediate sports'
                  break;
                case 'advanced':
                  sportClass = 'sports-advanced sports'
                  break;
              }

              return (
                <li type="button" className="{sportClass}" key={i}>{sport.name}</li>
                );
              }, this)}
          </ul>
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
          <span>Please add some sports!</span>
        </div>
      )}
  },
})


var Name = React.createClass({
  getInitialState: function() {
    return { form: false,
              first_name: this.props.first_name};
  },
  onClick: function() {
    var current_form = this.state.form
    this.setState({ form: !current_form});
    console.log('click')
  },
  handleChange: function() {
    this.setState({first_name: event.target.value});
  },
  render: function() {
    if (this.state.form) {
      return(
        <div>
          <input type="text" id='first_name' onChange={this.handleChange} value={this.state.first_name}></input>
        </div>
        );
        } else {
          return(<span id='first_name' onClick={this.onClick} >{this.state.first_name}</span>);
        }
  }
})

var Age = React.createClass({
  getInitialState: function() {
    return { form: false,
              age: this.props.age};
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
        <div>
          <input type="text" id='age' value={this.state.age}></input>
        </div>
        );
        } else {
          return(<span id='age' onClick={this.onClick} onChange={this.handleChange}>{this.state.age}</span>);
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
  },
  render: function() {
    if (this.state.form) {
      return(
        <div>
          <textarea id='bio' rows="4" columns="20" onChange={this.handleChange} value={this.state.bio}></textarea>
          <input className="submit" type="submit" value="Ok" ></input>
        </div>
        );
        } else if (!this.props.bio){
          return(
            <div>
              <textarea id='bio' rows="4" columns="20" onChange={this.handleChange} value={this.state.bio}>
                Please write your profile information here!
              </textarea>
            </div>
          );
        } else {
          return(<span id='bio' onClick={this.onClick} >{this.state.bio}</span>);
        }
  }
})

var Save = React.createClass({
  getInitialState: function() {
    return { form: false};
  },
  onClick: function() {
    console.log('Save')
  },
  render: function() {
    if (this.props.done) {
      return(
          <div>
             <hr />
             <hr />
             <input type="submit" className="Save">Save</input>
          </div>
          );
        } else {
          return (<div></div>)
        }
  }
})
