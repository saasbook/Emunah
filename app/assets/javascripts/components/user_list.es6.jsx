class UserList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props }
  }

  handleDelete(id) {
  }

  render () {
  	users = []
  	for (var i=0; i < this.state.users.length; i++) {
  		var user = this.state.users[i]
  		users.push(
  			<ListRow 
          key={user.id} 
          user={user} 
          current={this.state.user.id} 
          handleDelete={(id) => this.handleDelete(id)}
          />
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
    var edit = "users/" + this.props.user.id + "/edit"
    var del = "users/" + this.props.user.id
    this.state = {
      edit: edit,
      delete: del
    }
  }

  handleDelete() {
  }

	render () {
		var role = this.props.user.role;
    var edit = "users/" + this.props.user.id + "/edit";
    var del = "users/" + this.props.user.id;
    var button = (<button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>);
    if (this.props.user.id == this.props.current) {
      button = (<button className="btn btn-danger disabled">Delete</button>);
    }
		return (
			<tr>
				<th scope="row">{this.props.user.full_name}</th>
				<td>{this.props.user.email}</td>
				<td>{role}</td>
				<td>
          <a href={this.state.edit} className="btn btn-default">Edit</a>
          {button}
        </td>
			</tr>
		)
	}
}
