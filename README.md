# Time To Answer
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/Wpaif/time_to_answer/blob/main/LICENSE) 

# About this project
An application that consists of a platform for solving questions with generic subjects, where, like administrators, it can be managed from the administrative panel.

# Objective
Application developed with the objective of learning the basic concepts of the Ruby on Rails framework, as well as the Model-View-Controller(MVC) pattern used


# Technologies Used
<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.5
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      5.3
    </td>
  </tr>
  <tr>
    <td>Node version</td>
    <td>
      16.13.2
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3
    </td>
  </tr>
</table>

# Running Locally

## Clone the repository and enter the folder
```zsh
git clone https://github.com/Wpaif/time_to_answer.git
cd time_to_answer
```

## Install Node and Ruby On Rails dependencies respectively
```
yarn install
bundle install
```

## Run the project

```
rails db:cretate
rails db:migrate
rails server
```
Open the browser at the address `http://localhost:3000`

# Author
Wilian Ferreira
