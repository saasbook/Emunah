class SubmittalsList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { ... props, submittals: this.props.submittals, total_submittals: this.props.submittals }
  }

  handleDelete(id) {
    var submittals = this.state.submittals.filter((submittal) => {
      return !(submittal.id === id);
    })
    this.setState({
      submittals: submittals
    })
  }

  handleKeyPress(event) {
    str = String(event.target.value);
    if (str == '') {
      this.setState({
        submittals: this.state.total
      })
    } else {
      var submittals = this.state.submittals.filter((family) => {
        str = str.toLowerCase()

        family_name = family['family_name'].toLowerCase().includes(str)
        if (family_name) {
          return family_name
        }

        var people = JSON.parse(this.props.people[family.id])
        for (var i=0; i<people.length; i++) {
          var p = people[i]
          var val = p.first_name + " " + p.last_name
          console.log(val, str)
          if (val.toLowerCase().includes(str)) {
            return true
          }
        } 

        var family_keys = Object.keys(family)
        for (var i=0;i<family_keys.length;i++) {
          var val = String(family[family_keys[i]])
          if (val.toLowerCase().includes(str)) {
            return true
          }
        }

        return false
      });
      this.setState({
        submittals: submittals
      });
    }
  }

  render () {
  	submittals = []
  	for (var i=0; i < this.state.submittals.length; i++) {
  		var submittal = this.state.submittals[i]
      console.log(submittal.reviewed)
  		submittals.push(
  			<SubmittalsListRow 
          key={submittal.id} 
          submittal={submittal}
          entry={submittal.updated_at}
          notes={submittal.notes}
          role={this.props.role}
          reviewed={submittal.reviewed}
          is_dash={this.props.is_dash}
          family_name={submittal.family_name}
          family_id={submittal.family_id}
          path={"/submittals/" + submittal.family_id}
          handleDelete={(id) => this.handleDelete(id)}
          />
  		)
      submittals.push(
        <tr>
          <td className="no-border no-padding" colSpan={4}>
            <div className="well">
              {submittal.notes}
            </div>
          </td> 
        </tr>
      )
  	}

    var recent = (<th> Entry Date </th>)
    var status = (this.props.role == "admin") ? (<th> Status </th>) : null;
    var family = (this.props.is_dash == "true") ? (<th> Family Name </th>) : null;
    var actions = (this.props.role == "admin") ? (<th> Actions </th>) : null;

    return (
    <div>
    <div className="input-group">
        <input 
          type="text" 
          className="form-control" 
          aria-describedby="basic-addon1" 
          onChange={(e) => this.handleKeyPress(e)}
          />
        <br/>
      </div>
    <table className="table">
    	<thead>
    		<tr>
    			<th> Submittal Name </th>
          {recent}
          {status}
          {family}
    			{actions}
    		</tr>
    	</thead>
    	<tbody>
    		{submittals}
    	</tbody>
    </table>
    </div>
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
      delete: del,
      expanded: false
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


  printDate(date) {
    return date.split(' ').slice(0,5).join(' ')
  }

  getStatusLink(endpoint) {
    return "/families/" + this.props.family_id + "/submittals/" + this.props.submittal.id + "/" + endpoint;
  }

  getFamilyPath(id) {
    return "/families/" + this.props.family_id + "/submittals/" + id;
  }

	render () {
    var name = (<a href={this.state.show}> {this.props.submittal.title}  </a>);
    var recent = 
      (<td className="blue-highlight">
        {this.printDate(Date(this.state.entry))}
        </td>
      );
    var family = (this.props.is_dash == "true") ?
     (<td>
        <a href={this.getFamilyPath(this.props.submittal.id)} className="btn btn-info">{this.state.family_name}</a>
       </td>
      ) : null;
    var status = (!this.props.reviewed) ? 
      (<a href={this.getStatusLink("approve")} className="btn btn-default">Approve</a>) :
      (<a href={this.getStatusLink("revoke")} className="btn btn-warning">Revoke</a>);

    var actions = (this.props.role == "admin") ? 
      (<td>
        <a href={this.state.edit} className="btn btn-default">Edit</a>
        {status} 
        <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
       </td>
      ) : null;
    var status = (this.props.role == "admin") ?
      (<td>
        <p> {(this.props.reviewed) ? "approved" : "pending"} </p>
      </td>
      ) : null;

		return (
			<tr>
				<th scope="row">{name}</th>
        {recent}
        {status}
        {family}
        {actions}
			</tr>
		)
	}
}
