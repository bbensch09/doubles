var MessageBox = React.createClass({
  loadMessagesFromServer: function() {
    console.log("loading from server...");
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        console.log(data);
        this.setState(data);
      }.bind(this),
      error: function(xhr, status, error) {
        console.error(this.props.url, status, error.toString());
      }.bind(this)
    });
  },

  getInitialState: function() {
    console.log(this.props.presenter);
    return JSON.parse(this.props.presenter);
  },

  handleMessageSubmit: function ( formData, action ) {
    $.ajax({
      data: formData,
      url: action,
      type: "POST",
      dataType: "json",
      success: function ( data ) {
        this.setState({ messages: data });
      }.bind(this)
    });
  },

  componentDidMount: function() {
    this.loadMessagesFromServer();
    setInterval(this.loadMessagesFromServer, this.props.updateInterval);
  },

  render: function () {
    return (
      <div className="message-box">
        <MessageList messages={ this.state.messages } />
        <hr />
        <MessageForm form={ this.state.form } onMessageSubmit={ this.handleMessageSubmit } />
      </div>
    );
  }
});

var MessageList = React.createClass({
  render: function () {
    var messageNodes = this.props.messages.map(function ( message ) {
      return <Message author={ message.user_id } text={ message.message_text } key={ message.id } />
    });

    return (
      <div className="message-list">
        { messageNodes }
      </div>
    )
  }
});

var MessageForm = React.createClass({
  handleSubmit: function ( event ) {
    event.preventDefault();

    var author = this.refs.author.getDOMNode().value.trim();
    var text = this.refs.text.getDOMNode().value.trim();

    // validate
    if (!text) {
      return false;
    }

    // submit
    var formData = $( this.refs.form.getDOMNode() ).serialize();
    this.props.onMessageSubmit( formData, this.props.form.action );

    this.refs.text.getDOMNode().value = "";
  },
  render: function () {
    return (
      <form ref="form" className="form-horizontal message-form" action={ this.props.form.action } acceptCharset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
        <div className="input-group">
          <input type="hidden" name={ this.props.form.csrf_param } value={ this.props.form.csrf_token } />
          <input type="hidden" ref="author" name="message[author]" value="test" placeholder="" />
          <input id="message" name="message[text]" ref="text" type="text" placeholder="Hi there!" className="form-control input-md" required="" />
          <span className="input-group-btn">
            <button id="submit" type="submit" name="submit" className="btn btn-success">Send</button>
          </span>
        </div>
      </form>
    )
  }
});

var Message = React.createClass({
  render: function () {
    return (
      <div>
        <h4>{ this.props.author } said:</h4>
        <p>{ this.props.text }</p>
      </div>
    )
  }
});
