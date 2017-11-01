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
	render () {
		var role = this.props.user.is_admin == "Yes" ? "admin" : "user";
		return (
			<tr>
				<th scope="row">{this.props.user.full_name}</th>
				<td>{this.props.user.email}</td>
				<td>{role}</td>
				<td>None</td>
			</tr>
		)
	}
}

