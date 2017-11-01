class UserList extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
  	users = []
  	for (var i=0; i < this.props.users.length; i++) {
  		var user = this.props.users[i]
  		users.push(
  			<ListRow key={user.id} user={user} />
  		);
  	}
    return (
    <table className="table">
    	<thead>
    		<tr>
    			<th> Name </th>
    			<th> Email </th>
    			<th> Role </th>
    			<th> Actions </th>
    		</tr>
    	</thead>
    	<tbody>
    		{users}
    	</tbody>
    </table>
    ); 
  }
}

class ListRow extends React.Component {

  constructor(props) {
    super(props)
    var edit = "/users/" + this.props.user.id + "/edit"
    var del = "/users/" + this.props.user.id
    this.state = {
      edit: edit,
      delete: del
    }
    console.log(this.state)
  }

  handleDelete() {
    console.log("Deleting " + this.state.delete)
    fetch(this.state.delete, {
      method: 'DELETE'
    })
  }

	render () {
		var role = this.props.user.is_admin == "Yes" ? "admin" : "user";
    var edit = "users/" + this.props.user.id + "/edit";
    var del = "users/" + this.props.user.id;
		return (
			<tr>
				<th scope="row">{this.props.user.full_name}</th>
				<td>{this.props.user.email}</td>
				<td>{role}</td>
				<td>
          <a href={this.state.edit} className="btn btn-default">Edit</a>
          <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
        </td>
			</tr>
		)
	}
}

