<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
      body {
        font-family: Arial, sans-serif;
        padding: 20px;
        background: white;
      }
      .box {
        max-width: 500px;
        margin: 30px auto;
        padding: 25px;
        border: 1px solid #ccc;
        border-radius: 8px;
      }
      h1 {
        text-align: center;
        color: #1e293b;
        font-size: 25px;
      }
      input,
      select,
      button {
        width: 100%;
        box-sizing: border-box;
        padding: 12px;
        font-size: 16px;
      }
      button {
        margin-top: 20px;
        background: #1e293b;
        color: white;
      }
    </style>

    <script>
      function validate() {
        const user = document.getElementById("user").value.trim();
        const action = document.getElementById("action").value;
        const charge = document.getElementById("charge").value.trim();
        const dt = document.getElementById("dt").value;

        if (user === "") {
          alert("Please enter name.");
          return false;
        }

        if (!/^[A-Za-z ]+$/.test(user)) {
          alert("Name should contain letters.");
          return false;
        }

        const validPets = ["dog", "cat", "bird", "rabbit"];

        if (!validPets.includes(action)) {
          alert("Please select a valid pet.");
          return false;
        }
        if (charge === "") {
          alert("Please enter the charges.");
          return false;
        }

        if (dt === "") {
          alert("Please select the visit date.");
          return false;
        }

        const visitDate = new Date(dt + "T00:00:00");
        const today = new Date();
        today.setHours(0, 0, 0, 0);

        if (visitDate > today) {
          alert("Visit date cannot be in the future.");
          return false;
        }
        alert("Form validated successfully!");
        return true;
      }
    </script>
  </head>

  <body>
    <div class="box">
      <h1>PET CLINIC VISIT LOG ENTRY</h1>
      <form action="pet" method="post" onsubmit="return validate();">
        OWNER:
        <input type="text" id="user" name="user" placeholder="Monika Wankhede" required />

        PET:
        <select id="action" name="action" required>
          <option value="">Select Animal</option>
          <option value="dog">Dog</option>
          <option value="cat">Cat</option>
          <option value="bird">Bird</option>
          <option value="rabbit">Rabbit</option>
        </select>

        Charges (Rs.)
        <input type="number" id="charge" name="charge" placeholder="500"required/>

        Visit Date:
        <input type="date" id="dt" name="dt" required />

        <button type="submit">Save</button>
      </form>
    </div>
  </body>
</html>
