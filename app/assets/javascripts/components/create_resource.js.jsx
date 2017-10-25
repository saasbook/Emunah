class CreateResource extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    window.location = this.props.url
  }

  capitalizeFirst(w) {
    return w.charAt(0).toUpperCase() + w.substring(1)
  } 

  pluralize(w) {
    return w + 's'
  }

  render () {
    const img = "/images/" + this.props.title + ".svg"
    return (
      <div 
        className="wrapper" 
        style={{backgroundColor: this.props.color}} 
        onClick={this.handleClick}
        >
        <div className="wrapper-header">
          <h2> {this.capitalizeFirst(this.props.action)} {this.props.title} </h2>
          <p> Click here to {this.props.action} a {this.props.title} </p>
        </div>
      </div>
    ); 
  }
}
