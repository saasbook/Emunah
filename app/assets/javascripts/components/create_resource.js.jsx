class CreateResource extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    window.location = this.props.url
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
          <h2> Create {this.props.title} </h2>
          <p> Click here to create a {this.props.title} </p>
        </div>
      </div>
    ); 
  }
}


