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

var PickSports = React.createClass({
  getInitialState: function() {
    return {value: '',
            mySports: [],
            sports: this.props.sports};
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
    this.setState({chosenSport: sportToAdd, value: ''})
    this.refs.sports_list.setState({sports: []})
  },
  render: function() {
    return(
      <div>
        <input className="input center" type="text" ref="search" placeholder="Search for your sport" autocapitalize="off" autocorrect="off" value={this.state.value} onChange={this.handleChange} />
          <SportsOptions sports={this.state.sports} ref="sports_list" onChange={this.setChosenSport}/>
        <ChosenSport chosenSport={this.state.chosenSport} ref="chosenSport" saveSport={this.saveSport}/>
      </div>
      )
  },
  saveSport: function(skill_level) {
    var chosenSport = this.state.chosenSport;
    var closeSearch = this.props.closeSearch;
    new_sports_array = this.state.sports.remove(this.state.chosenSport);
    this.setState({sports: new_sports_array})
    $.post( '/activity_blurbs',
            {activity_id: chosenSport.id, text: skill_level},
            function(activity_blurb_object) {
        console.log(activity_blurb_object);
        console.log("activity successfully updated via react");
        closeSearch(chosenSport, activity_blurb_object);
      });
  }
})

var SportsOptions = React.createClass({
  getInitialState: function() {
      return { sports: []};
    },
  render: function() {
      if(this.state.sports.length) {
      return(
          <ul className="menu-container">{this.state.sports.map(function(sport, i) {
              return (
                <li type="button" className="btn sport_options" key={i} onClick={this.handleClick.bind(this, i)}>
                  <span className="pull-left icon fa fa-plus-circle list_plus"></span>
                  <span className="pull-left sport_item">{sport.name}</span>
                </li>
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
            <h3 className="center skill-header">
              What is your skill level?
            </h3>
          </div>
        <SkillLevel ref="SkillLevel" saveSport={this.props.saveSport}/>
        </div>
       )
    } else { return null };
  }
})

// Beginner: 0 , Intermediate: 1, Advanced: 2

var SkillLevel = React.createClass({
  getInitialState: function() {
      return { selected: '0'};
    },
  render: function() {
      return(
      <div className="activity_level">
        <button data-dismiss="modal" id="beginner" onClick={this.handleClick.bind(this, 'beginner')} className="btn-skill pull-left">Beginner</button>
        <button data-dismiss="modal" id="intermediate" onClick={this.handleClick.bind(this, 'intermediate')} className="btn-skill">Intermediate</button>
        <button data-dismiss="modal" id="advanced" onClick={this.handleClick.bind(this, 'advanced')} className="btn-skill pull-right">Advanced</button>
      </div>
       )
  },
  handleClick: function(skill_level) {
    this.props.saveSport(skill_level)
  }
});
