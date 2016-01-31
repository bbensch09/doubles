console.log("loaded messaging");

var MessageBox = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  loadMessagesFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, error) {
        console.error(this.props.url, status, error.toString());
      }.bind(this)
    });
  },

  handleMessageSubmit: function(message) {
    var messages = this.state.data;
    message.id = Date.now();
    var newMessages = messages.concat([message]);
    this.setState({data: newMessages});
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: message,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, error) {
        this.setState({data: messages});
        console.error(this.props.url, status, error.toString());
      }.bind(this),
    });
  },

  componentDidMount: function() {
    this.loadMessagesFromServer();
    setInterval(this.loadMessagesFromServer, this.props.updateInterval);
  },
  render: function() {
    return (
      <div className="messageBox">
        <h1>Doubles Chat</h1>
        <MessageList data={this.state.data} />
        <MessageForm onMessageSubmit={this.handleMessageSubmit} />
      </div>
      );
  }
});

var MessageList = React.createClass({
  render: function() {
    var messageNodes = this.props.data.map(function(message) {
      return (
        <Message author={message.author} key={message.id}>
          {message.text}
        </Message>
      );
    });
    return (
      <div className="messageList">
        {messageNodes}
      </div>
    );
  }
});

var MessageForm = React.createClass({
  getInitialState: function() {
    return {text: ''};
  },

  handleTextChange: function(event) {
    this.setState({text: event.target.value});
  },

  handleSubmit: function(event) {
    event.preventDefault();
    var text = this.state.text.trim();
    if (!text) {
      return;
    }
    this.props.onMessageSubmit({author: 'nil', text: text});
    this.setState({text: ''});
  },

  render: function() {
    return (
      <form className="form-horizontal messageForm" onSubmit={this.handleSubmit}>
        <div className="input-group">
          <input id="message" name="message" type="text" placeholder="Hi there!" className="form-control input-md" required="" value={this.state.text} onChange={this.handleTextChange} />
          <span className="input-group-btn">
            <button id="submit" name="submit" className="btn btn-success">Send</button>
          </span>
        </div>
      </form>
      );
  }
});

var Message = React.createClass({
  render: function() {
    return (
      <div className="message">
        <h3 className="messageAuthor">{this.props.author}</h3>
        {this.props.children}
      </div>
      );
  }
});

ReactDOM.render(
  <MessageBox url="/api/comments" updateInterval={1000} />,
  document.getElementById('content')
  )