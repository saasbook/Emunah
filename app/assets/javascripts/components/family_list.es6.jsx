const KEYS = ["membership", "discovery", "hobbies", "skills", "activities", "committees"]

class FamilyList extends React.Component {
  constructor(props) {
    super(props)
    var families = this.contructExpandedList(this.props.families)
    this.state = { ... props, total: this.props.families, compact: true, expanded: families}
  }

  contructExpandedList(families) {
    expanded = {}
    for (var i=0; i<families.length; i++) {
      var family = families[i]
      expanded[family.id] = false
    }
    return expanded
  }

  handleDelete(id) {
    var families = this.state.families.filter((family) => {
      return !(family.id === id);
    })
    this.setState({
      families: families
    })
  }

  filterFamilies(key) {
    return (a,b) => {
      aLower = a[key].toLowerCase();
      bLower = b[key].toLowerCase();
      if (a[key] > b[key]) return 1;
      if (a[key] < b[key]) return -1;
      return 0
    }
  }


  sort(key) {
    var families = this.state.families.sort(this.filterFamilies(key));
    this.setState({
      families: families
    })
  }

  handleKeyPress(event) {
    str = String(event.target.value);
    if (str == '') {
      this.setState({
        families: this.state.total
      })
    } else {
      var families = this.state.families.filter((family) => {
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
        families: families
      });
    }
  }

  handleExpand(id) {
    var swap = this.state.expanded
    swap[id] = !swap[id]
    this.setState({
      expanded: swap
    })
  }

  render () {
  	families = []
  	for (var i=0; i < this.state.families.length; i++) {
  		var family = this.state.families[i]

      var people = JSON.parse(this.props.people[family.id]);
      var len = people.length
      var p1 = (len > 0) ? people[0] : null;
      var p2 = (len > 1) ? people[1] : null;

  		families.push(
  			<FamilyListRow 
          key={family.id} 
          family={family} 
          people={people}
          role={this.props.role}
          handleExpand={(id) => this.handleExpand(id)}
          handleDelete={(id) => this.handleDelete(id)}
          compact={this.state.compact}
          />
  		)
      if (this.state.expanded[family.id]) {
        families.push(
          <tr>
            <td colSpan={4} className="detail-row">
              <FamilyCard
                key={family.id + " " + family.id}
                expanded={this.state.expanded[family.id]}
                family={family}
                people={people}
                />
            </td>
          </tr>
        )
      }
    }

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
      			<th onClick={() => this.sort("family_name")}> Family Name </th>
            <th> Person 1 </th>
            <th> Person 2 </th>
     			  {actions}
      		</tr>
      	</thead>
      	<tbody>
      		{families}
      	</tbody>
      </table>
    </div>
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
    this.props.handleDelete(this.props.family.id)
  }

  getPersonName(person) {
    return (person != null) ? person.first_name + " " + person.last_name : "none";
  }

  toggleExpand(id) {
    var swap = !this.expanded;
    this.setState({
      expanded: swap
    })
  }

	render () {
    var edit = "/families/" + this.props.family.id + "/families";
    var del = "/families/" + this.props.family.id;
    var show = "/families/" + this.props.family.id;

    var people = this.props.people
    var len = people.length
    var p1 = (len > 0) ? people[0] : null;
    var p2 = (len > 1) ? people[1] : null;

    var details = this.props.compact ? (null) : null

    var actions = (this.props.role == "admin") ? (
      <div>
        <a href={this.state.edit} className="btn btn-default">Edit</a>
        <button className="btn btn-danger" onClick={() => this.handleDelete()}>Delete</button>
      </div>
      ) : null;
		return (
			<tr key={this.props.family_name + " " + this.props.family.id}>
				<th scope="row" className="vertical-align-middle ">
          <a href={show} className="link table-focus">
            {this.props.family.family_name + "  "}
          </a>
          <span className="glyphicon glyphicon-resize-full glyph-expand" onClick={() => this.props.handleExpand(this.props.family.id)}></span>
        </th>
        <td className="vertical-align-middle "> {this.getPersonName(p1)} </td>
        <td className="vertical-align-middle "> {this.getPersonName(p2)} </td> 
				<td className="vertical-align-middle ">
          {actions} 
        </td>
			</tr>
		)
	}
}

class FamilyCard extends React.Component {

  constructor(props) {
    super(props)
  }

  generateRows(list, dataType) {
    data = []
    for (var i=0; i<list.length; i++) {
      data.push(
        <p> {list[i]} </p>
      )
    }

    return (
      <td className="padding-left padding-top vertical-align-top" rowSpan={list.length}>
        {data}
      </td>
    )
  }

  render () {
    var info = []
    for (var i=0; i<KEYS.length; i++) {
      var key = KEYS[i];
      var fam = String(this.props.family[key]).split(', ')
      var rows = this.generateRows(fam, key);
      info.push(rows)
    }
    
    return (
      <div className="card">
        <div className="card-body">
          <table className="table">
            <thead className="thead-dark">
              <tr>
                <th> Membership </th>
                <th> Discovery </th>
                <th> Hobbies </th>
                <th> Skills </th>
                <th> Activities </th>
                <th> Committees </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                {info}
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    )
  }

}