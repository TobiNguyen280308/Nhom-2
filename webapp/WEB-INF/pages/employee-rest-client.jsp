<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Employee Management</title>
</head>
<body>

<div>
  <input id="id" placeholder="Id?"><br>
  <input id="name" placeholder="Name?"><br>

  <input type="radio" id="male" name="gender" checked> Male
  <input type="radio" id="female" name="gender"> Female<br>

  <input id="salary" placeholder="Salary?">

  <hr>

  <button onclick="ctrl.create()">Create</button>
  <button onclick="ctrl.update()">Update</button>
  <button onclick="ctrl.delete()">Delete</button>
  <button onclick="ctrl.reset()">Reset</button>
</div>

<hr>

<table border="1" width="100%">
  <thead>
  <tr>
    <th>Id</th>
    <th>Name</th>
    <th>Gender</th>
    <th>Salary</th>
    <th></th>
  </tr>
  </thead>
  <tbody id="list"></tbody>
</table>

<script>
  var API = "<%=request.getContextPath()%>/employees";

  var ctrl = {

    setForm(employee){
      document.getElementById("id").value = employee.id;
      document.getElementById("name").value = employee.name;
      document.getElementById("salary").value = employee.salary;

      if(employee.gender){
        document.getElementById("male").checked = true;
      } else {
        document.getElementById("female").checked = true;
      }
    },

    getForm(){
      return {
        id: document.getElementById("id").value,
        name: document.getElementById("name").value,
        gender: document.getElementById("male").checked,
        salary: parseFloat(document.getElementById("salary").value)
      }
    },

    fillToTable(employees){
      var rows = [];

      employees.forEach(e => {
        var row = `
            <tr>
                <td>${e.id}</td>
                <td>${e.name}</td>
                <td>${e.gender ? 'Male':'Female'}</td>
                <td>${e.salary}</td>
                <td><a href="javascript:ctrl.edit('${e.id}')">Edit</a></td>
            </tr>
            `;
        rows.push(row);
      });

      document.getElementById("list").innerHTML = rows.join('');
    },

    loadAll(){
      fetch(API)
              .then(resp => resp.json())
              .then(data => {
                console.log("DATA:", data);
                this.fillToTable(data);
              })
              .catch(err => console.error("LOAD FAIL:", err));
    },

    create(){
      var data = this.getForm();

      fetch(API, {
        method: "POST",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify(data)
      })
              .then(resp => resp.json())
              .then(() => {
                this.loadAll();
                this.reset();
              });
    },

    update(){
      var data = this.getForm();

      fetch(API + "/" + data.id, {
        method: "PUT",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify(data)
      })
              .then(() => this.loadAll());
    },

    delete(){
      var id = document.getElementById("id").value;

      fetch(API + "/" + id, {
        method: "DELETE"
      })
              .then(() => {
                this.loadAll();
                this.reset();
              });
    },

    reset(){
      this.setForm({id:"", name:"", salary:0, gender:true});
    },

    edit(id){
      fetch(API + "/" + id)
              .then(resp => resp.json())
              .then(data => this.setForm(data));
    }
  }

  ctrl.loadAll();

</script>

</body>
</html>