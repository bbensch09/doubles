var MessageBox = React.createClass({
  loadMessagesFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState(data);
      }.bind(this),
      error: function(xhr, status, error) {
        console.error(this.props.url, status, error.toString());
      }.bind(this)
    });
  },

  getInitialState: function() {
    return JSON.parse(this.props.presenter);
  },

  handleMessageSubmit: function ( formData, action ) {
    $.ajax({
      data: formData,
      url: action,
      type: "POST",
      dataType: "json",
      success: function ( data ) {
        this.setState(data);
      }.bind(this)
    });
  },

  componentDidMount: function() {
    this.loadMessagesFromServer();
    this.loadInterval = setInterval(this.loadMessagesFromServer, this.props.updateInterval);
  },

  componentWillUnmount: function() {
    this.loadInterval && clearInterval(this.loadInterval);
    this.loadInterval = false;
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
      return <Message cssClass={ message.css_class } author={ message.sender_name } text={ message.message_text } key={ message.id } />
    });

    return (
      <div className="message-list">
        { messageNodes }
      </div>
    )
  }
});

var MessageForm = React.createClass({
  getInitialState: function() {
    return {author: this.props.form.sender_id, matched_user_id: this.props.form.matched_user_id, text: ''};
  },

  handleTextChange: function(event) {
    this.setState({text: event.target.value});
  },

  handleSubmit: function ( event ) {
    event.preventDefault();
    var text = this.state.text.trim();
    var author = this.state.author;
    var matched_user_id = this.state.matched_user_id;
    // validate
    if (!text) {
      return false;
    }
    // submit
    this.props.onMessageSubmit( {matched_user_id: matched_user_id, author: author, text: text}, this.props.form.action );
    this.setState({text: ''});
  },
  render: function () {
    return (
      <form ref="form" className="form-horizontal message-form" action={ this.props.form.action } acceptCharset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
        <div className="input-group">
          <input type="hidden" name={ this.props.form.csrf_param } value={ this.props.form.csrf_token } />
          <input type="hidden" ref="author" name="message[author]" value={this.state.author} readOnly />
          <input type="hidden" ref="matched_user_id" name="message[matched_user_id]" value={this.state.matched_user_id} readOnly />
          <input id="message" name="message[text]" ref="text" type="text" placeholder="Hi there!" className="form-control input-md" required="" value={this.state.text} onChange={this.handleTextChange} />
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
      <div className={ this.props.cssClass }>
        <h4><u>{ this.props.author } said</u>:</h4>
        <p>{ this.props.text }</p>
      </div>
    )
  }
});
