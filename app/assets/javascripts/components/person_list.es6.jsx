class PeopleList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props }
  }

  handleDelete(id) {
    console.log("Delete " + id)
    var people = this.state.people.filter((person) => {
      return !(person.id === id);
    })
    this.setState({
      people: people
    })
  }

  render () {
  	people = []
  	for (var i=0; i < this.state.people.length; i++) {
  		var person = this.state.people[i]
  		people.push(
  			<PeopleListRow 
          key={person.id} 
          person={person} 
          role={this.props.role}
          handleDelete={(id) => this.handleDelete(id)}
          />
  		);
  	}
    var actions = (this.props.role == "admin") ? (<th> Actions </th>) : null;
    return (
    <table className="table">
    	<thead>
    		<tr>
    			<th> Person Name </th>
    			{actions}
    		</tr>
    	</thead>
    	<tbody>
    		{people}
    	</tbody>
    </table>
    ); 
  }
}

class PeopleListRow extends React.Component {

  constructor(props) {
    super(props)
    var edit = "people/" + this.props.person.id + "/edit"
    var del = "people/" + this.props.person.id
    this.state = {
      edit: edit,
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
    this.props.handleDelete(this.props.person.id)
  }

	render () {
    var show = "/person/" + this.props.person.id
    var edit = "/person/" + this.props.person.id + "/edit";

    var actions = (this.props.role == "admin") ? 
      (<td>
        <a href={show} className="btn btn-default">Show</a>
        <a href={edit} className="btn btn-default">Edit</a>
        <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
       </td>
      ) : null;

		return (
			<tr>
				<th scope="row">{this.props.person.full_name}</th>
        {actions}
			</tr>
		)
	}
}
