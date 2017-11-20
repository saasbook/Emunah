class UserList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props, total: this.props.users }
  }

  handleDelete(id) {
    var users = this.state.users.filter((user) => {
      return !(user.id === id);
    })
    this.setState({
      users: users
    })
  }

  filterUsers(key) {
    return (a,b) => {
      aLower = a[key].toLowerCase();
      bLower = b[key].toLowerCase();
      if (a[key] > b[key]) return 1;
      if (a[key] < b[key]) return -1;
      return 0
    }
  }

  sort(key) {
    console.log("Sorting by " + key);
    var users = this.state.users.sort(this.filterUsers(key));
    this.setState({
      users: users
    })
  }

  handleKeyPress(event) {
    str = event.target.value;
    if (str == '') {
      this.setState({
        users: this.state.total
      })
    } else {
      var users = this.state.users.filter((user) => {
        str = str.toLowerCase()
        return (user['full_name'].toLowerCase().includes(str) || user['email'].toLowerCase().includes(str) || user['role'].toLowerCase().includes(str))
      });
      this.setState({
        users: users
      });
    }
  }

  render () {
  	users = []
  	for (var i=0; i < this.state.users.length; i++) {
  		var user = this.state.users[i]
  		users.push(
  			<UserListRow 
          key={user.id} 
          user={user} 
          current={this.state.user.id} 
          handleDelete={(id) => this.handleDelete(id)}
          />
  		);
  	}
    return (
    <div>
      <div className="input-group">
        <input 
          type="text" 
          className="form-control" 
          aria-describedby="basic-addon" 
          onChange={(e) => this.handleKeyPress(e)}
          />
        <br/>
      </div>
      <table className="table">
      	<thead>
      		<tr>
      			<th onClick={() => this.sort("full_name") }> Name </th>
      			<th onClick={() => this.sort("email") }> Email </th>
      			<th onClick={() => this.sort("role") }> Role </th>
      			<th> Actions </th>
      		</tr>
      	</thead>
      	<tbody>
      		{users}
      	</tbody>
      </table>
    </div>
    ); 
  }
}

class UserListRow extends React.Component {

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
    this.props.handleDelete(this.props.user.id)
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
