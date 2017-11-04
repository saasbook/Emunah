class FamilyList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props }
  }

  handleDelete(id) {
  }

  render () {
  	families = []
  	for (var i=0; i < this.state.families.length; i++) {
  		var family = this.state.families[i]
  		families.push(
  			<FamilyListRow 
          key={family.id} 
          family={family} 
          handleDelete={(id) => this.handleDelete(id)}
          />
  		);
  	}
    return (
    <table className="table">
    	<thead>
    		<tr>
    			<th> Family Name </th>
    			<th> Actions </th>
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
    var edit = "families/" + this.props.family.id + "/edit"
    var del = "families/" + this.props.family.id
    this.state = {
      edit: edit,
      delete: del
    }
  }

  handleDelete() {
  }

	render () {
    var edit = "families/" + this.props.family.id + "/families";
    var del = "families/" + this.props.family.id;
		return (
			<tr>
				<th scope="row">{this.props.family.family_name}</th>
				<td>
          <a href={this.state.edit} className="btn btn-default">Edit</a>
          <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
        </td>
			</tr>
		)
	}
}
