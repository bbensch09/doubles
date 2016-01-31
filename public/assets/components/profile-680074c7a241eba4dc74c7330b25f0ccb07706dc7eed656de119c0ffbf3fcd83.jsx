
// Current data source
// To be replaced with AJAX call, etc.
// var user = {
//   "first_name": "Abe",
//   "last_name": "Clark",
//   "age": 18,
//   "profile_picture_url": "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/6/005/096/07c/1427c21.jpg",
//   "blurb": "I am Abe and I love this App.",
//   "sports": [
//       {"name": "Wrestling", "blurb": "I love Wrestling"},
//       {"name": "Baseball", "blurb": "Baseball is life"},
//       {"name": "Running", "blurb": "Run or DIEEEEEEE"},
//       {"name": "Snorkeling", "blurb": "I can swim"},
//       {"name": "Tag", "blurb": "I want to play tag with Greg"},
//       {"name": "Eating", "blurb": "Nom Nom Nom"},
//     ]
//   }

// // Will replace the current data model when server is live
//   loadMessagesFromServer: function() {
//     $.ajax({
//       url: this.props.url,
//       dataType: 'json',
//       cache: false,
//       success: function(data) {
//         this.setState({user: data['user']});
//       }.bind(this),
//       error: function(xhr, status, error) {
//         console.error(this.props.url, status, error.toString());
//       }.bind(this)
//     });



var Profile = React.createClass({
  render: function() {
    return(
      <div class="row">
      <h1>TEST</h1>
       <img className="profile_picture" src={this.props.user.profile_picture_url} alt="Profile Picture" />
       <div className="profile_headline">
         <h1 className="pull-left">{this.props.user.first_name}</h1>
         <h1 className="pull-right">{this.props.user.age}</h1>
       </div>
       <div class="clearfix"></div>
       <hr />
       // <Sports sports={user.sports} />
      </div>
      )
  }
})
console.log("profile.js.jsx:53")
var Sports = React.createClass({
  render: function() {
    return(
      <div>
        <ul>
        {this.props.sports.map(function(sport, i) {
            return (
              <li type="button" className="btn btn-info profile_sports" key={i} onClick={this.handleClick.bind(this, i)}>{sport.name}</li>
              );
            }, this)}
        </ul>
        <hr />
        <Blurb ref="blurb_div" blurb={user.blurb} />
        <hr />
      </div>
      )
  },

  handleClick: function(i) {
    this.refs.blurb_div.setState({blurb: this.props.sports[i].blurb})
  }
})


var Blurb = React.createClass({
  getInitialState : function() {
    return {
      blurb: this.props.blurb
    };
  },
  render: function() {
    return(
      <div>
        {this.state.blurb}
      </div>
      )
  }
});

// ReactDOM.render(
//   <Profile user={user} url="TBU"/>,
//   document.getElementById('main')
//  );

