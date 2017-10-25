var CreateResource = createReactClass({
  propTypes: {
    title: PropTypes.string,
    url: PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Url: {this.props.url}</div>
      </div>
    );
  }
});

