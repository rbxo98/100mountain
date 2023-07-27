import logo from './logo.svg';
import {Routes, Route, Link, useNavigate, Outlet } from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import Home from './page/home.js';
import NavbarHead from "./page/navBar";
import './App.css';

function App() {

  return (
    <div className="App">
      <Routes>
        <Route path='/' element={<Home></Home>}>Home</Route> {/*path는 라우팅 주소, element는 주로 컴포넌트*/}
        <Route path='/cert' element={<div><NavbarHead /> <Outlet /></div>}>
          <Route path='apply' element={<div>신청하세욧</div>} />
          <Route path='complete' element={<div>신청하세욧</div>} />
        </Route>
        <Route path='/souv' element={<div><NavbarHead /> <Outlet /></div>}>
          <Route path='apply' element={<div>신청하세욧</div>} />
          <Route path='proc' element={<div>신청하세욧</div>} />
          <Route path='complete' element={<div>신청하세욧</div>} />
        </Route>
        <Route path='/notice' element={<div>notice</div>}>Notice</Route>
        <Route path='*' element={<div>404 NOT FOUND</div>}>ERROR</Route> {/*404 ERROR*/}
      </Routes>
    </div>
  );
}

export default App;
