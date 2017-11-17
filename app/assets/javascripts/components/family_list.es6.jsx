class FamilyList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props }
  }

  handleDelete(id) {
    console.log("Delete " + id)
    var families = this.state.families.filter((family) => {
      return !(family.id === id);
    })
    this.setState({
      families: families
    })
  }

  render () {
  	families = []
  	for (var i=0; i < this.state.families.length; i++) {
  		var family = this.state.families[i]
  		families.push(
  			<FamilyListRow 
          key={family.id} 
          family={family} 
          role={this.props.role}
          handleDelete={(id) => this.handleDelete(id)}
          />
  		);
  	}
    console.log(this.props.role == "admin");
    var actions = (this.props.role == "admin") ? (<th> Actions </th>) : null;
    return (
    <table className="table">
    	<thead>
    		<tr>
    			<th> Family Name </th>
   			  {actions}
    		</tr>
    	</thead>
    	<tbody>
    		{families}
    	</tbody>
    </table>
    ); 
  }
}

class FamilyListRow extends React.Component {

  constructor(props) {
    super(props)
    var edit = "/families/" + this.props.family.id + "/edit"
    var del = "/families/" + this.props.family.id
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
    this.props.handleDelete(this.props.family.id)
  }

	render () {
    var edit = "/families/" + this.props.family.id + "/families";
    var del = "/families/" + this.props.family.id;
    var show = "/families/" + this.props.family.id;

    var actions = (this.props.role == "admin") ? (
      <div>
        <a href={this.state.edit} className="btn btn-default">Edit</a>
        <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
      </div>
      ) : null;
		return (
			<tr>
				<th scope="row">
          <a href={show} className="link">{this.props.family.family_name}</a>
        </th>
				<td>
          {actions} 
        </td>
			</tr>
		)
	}
}
