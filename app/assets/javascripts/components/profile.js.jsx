

// var Profile = React.createClass({
//   render: function() {
//     return(
//       <div class="row">
//        <img className="profile_picture" src={this.props.user.profile_picture_url} alt="Profile Picture" />
//        <div className="profile_headline">
//          <h1 className="pull-left">{this.props.user.first_name}</h1>
//          <h1 className="pull-right">{this.props.user.age}</h1>
//        </div>
//        <div class="clearfix"></div>
//        <hr />
//        <Sports sports={this.props.sports} bio={this.props.user.bio} />
//       </div>
//       )
//   }
// })

// var Sports = React.createClass({
//   render: function() {
//     return(
//       <div>
//         <ul>
//         {this.props.sports.map(function(sport, i) {
//             return (
//               <li type="button" className="btn btn-info profile_sports" key={i} onClick={this.handleClick.bind(this, i)}>{sport.name}</li>
//               );
//             }, this)}
//         </ul>
//         <hr />
//         <Blurb ref="blurb_div" blurb={this.props.bio} />
//         <hr />
//       </div>
//       )
//   },

//   handleClick: function(i) {
//     this.refs.blurb_div.setState({blurb: this.props.sports[i].blurb})
//   }
// })


// var Blurb = React.createClass({
//   getInitialState : function() {
//     return {
//       blurb: this.props.blurb
//     };
//   },
//   render: function() {
//     return(
//       <div className="blurb_text">
//         {this.state.blurb}
//       </div>
//       )
//   }
// });


