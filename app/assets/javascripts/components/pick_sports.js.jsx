// find_sport -- helper function to perform regex search
// PickSports >> SportsOptions, ChosenSport
//


var find_sport = function(wordToMatch, array_of_objects_to_query) {
  var regular_expression = new RegExp(wordToMatch, 'i')
  var results = []
  for ( var i = 0; i < array_of_objects_to_query.length; i++ )
    {
      if ( regular_expression.test(array_of_objects_to_query[i].name) ) {
            results.push(array_of_objects_to_query[i])
         }
    }
  return results
}

  // saveSport: function(sport_object_id) {
  //   $.post( '/activity_blurbs',
  //           {activity_id: sport_object_id, text: " "},
  //           function(data) {
  //       console.log(data);
  //     });
  //   }


var PickSports = React.createClass({
  getInitialState: function() {
    return {value: '', mySports: []};
  },
  componentDidMount: function() {
    this.refs.search.focus();
  },
  handleChange: function(event) {
    this.setState({value: event.target.value});
    var value = event.target.value;
    this.refs.sports_list.setState({sports: find_sport(value, this.props.sports)});
  },
  setChosenSport: function(sportToAdd) {
    this.setState({chosenSport: sportToAdd})
  },
  render: function() {
    return(
      <div>
        <h4>Add an activity</h4>
        <input className="input" type="text" ref="search" placeholder="Search for your sport" value={this.state.value} onChange={this.handleChange} />
        <SportsOptions sports={this.props.sports} ref="sports_list" onChange={this.setChosenSport}/>
        <hr />
        <ChosenSport chosenSport={this.state.chosenSport} ref="chosenSport"/>
      </div>
      )
  }
})

var SportsOptions = React.createClass({
  getInitialState: function() {
      return { sports: []};
    },
  render: function() {
      if(this.state.sports.length) {
      return(
          <ul>{this.state.sports.map(function(sport, i) {
              return (
                <li type="button" className="btn btn-info sport_options" key={i} onClick={this.handleClick.bind(this, i)}>{sport.name}</li>
                );
              }, this)}
          </ul>
       )
    } else { return null };
  },
  handleClick: function(i) {
    this.props.onChange(this.state.sports[i]);
  }
});

var ChosenSport = React.createClass({
  render: function() {
      if(this.props.chosenSport) {
      return(
        <div>
          <div>
          <h4 className="pull-left">Selected Sport:</h4>
          </div>
          <span className="btn btn-success sport_options" onClick={this.handleClick.bind(null, this)}>
            {this.props.chosenSport.name}
          </span>
        <hr />
        </div>
       )
    } else { return null };
  },
  handleClick: function() {

  }
})

// Beginner: 0 , Intermediate: 1, Advanced: 2

var SkillLevel = React.createClass({
  getInitialState: function() {
      return { selected: '0'};
    },
  render: function() {
      return(
        <div class="btn-group" role="group" aria-label="...">
          <button type="button" class="btn btn-default">Left</button>
          <button type="button" class="btn btn-default">Middle</button>
          <button type="button" class="btn btn-default">Right</button>
        </div>
       )
  },
  handleClick: function(i) {

  }
});


