class SubmittalsList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props }
  }

  handleDelete(id) {
    console.log("Delete " + id)
    var submittals = this.state.submittals.filter((submittal) => {
      return !(submittal.id === id);
    })
    this.setState({
      submittals: submittals
    })
  }

  render () {
  	submittals = []
  	for (var i=0; i < this.state.submittals.length; i++) {
  		var submittal = this.state.submittals[i]
  		submittals.push(
  			<SubmittalsListRow 
          key={submittal.id} 
          submittal={submittal}
          entry={submittal.updated_at} 
          role={this.props.role}
          is_dash={this.props.is_dash}
          family_name={submittal.family_name}
          path={"/families/" + submittal.family_id}
          handleDelete={(id) => this.handleDelete(id)}
          />
  		);
  	}

    var recent = (<th> Entry Date </th>)
    var family = (this.props.is_dash == "true") ? (<th> Family Name </th>) : null;
    var actions = (this.props.role == "admin") ? (<th> Actions </th>) : null;

    return (
    <table className="table">
    	<thead>
    		<tr>
    			<th> Submittal Name </th>
          {recent}
          {family}
    			{actions}
    		</tr>
    	</thead>
    	<tbody>
    		{submittals}
    	</tbody>
    </table>
    ); 
  }
}

class SubmittalsListRow extends React.Component {

  constructor(props) {
    super(props)
    var entry = this.props.entry
    var family_name = this.props.family_name
    var edit = this.props.path + "/submittals/" + this.props.submittal.id + "/edit"
    var del = this.props.path + "/submittals/" + this.props.submittal.id
    var show = this.props.path + "/submittals/" + this.props.submittal.id
    this.state = {
      entry: entry,
      family_name: family_name,
      edit: edit,
      show: show,
      delete: del
    }
  }

  handleDelete() {
    var token = document.getElementsByName("csrf-token")[0].content;
    if (this.state.delete != null) {
      fetch(this.state.delete, {
        method: 'DELETE',
        headers: {
          'X-CSRF-TOKEN': token
        },
        credentials: 'same-origin'
      })
    }
    this.props.handleDelete(this.props.submittal.id)
  }

	render () {
    var name = this.props.submittal.title;
    var recent = 
      (<td>
        {this.state.entry}
        </td>
      );
    var family = (this.props.is_dash == "true") ?
     (<td>
        <a href={this.props.path} className="btn btn-info">{this.state.family_name}</a>
       </td>
      ) : null;
    var actions = (this.props.role == "admin") ? 
      (<td>
        <a href={this.state.show} className="btn btn-default">Show</a>
        <a href={this.state.edit} className="btn btn-default">Edit</a>
        <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
       </td>
      ) : null;

		return (
			<tr>
				<th scope="row">{name}</th>
        {recent}
        {family}
        {actions}
			</tr>
		)
	}
}
