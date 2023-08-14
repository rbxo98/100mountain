import logo from './logo.svg';
import {Routes, Route, Link, useNavigate, Outlet } from 'react-router-dom';
// Follow this pattern to import other Firebase services
// import { } from 'firebase/<service>';
import Home from './page/home.js';
import NavbarHead from "./page/navBar";
import Notice from './page/notice';
import CertApply from './page/certApply';
import CertComp from './page/certComp';
import {WaybillInfo} from './page/waybilInfo';
import SouvApply from './page/souvApply';
import SouvProc from './page/souvProc';
import SouvComp from './page/souvComp';
import './App.css';
import { noticeDatas, souvAplDatas, souvProcDatas, souvCompDatas, certAplDatas, certCompDatas, questDatas } from './Db.js';
import { useState, useEffect } from "react";


function App() {
  const [applyData, setAplData] = useState([]); //State에 미리 값의 타입을 알려주면 undefined를 방지할 수 있다.
  const [predData, setPreData] = useState([]);
  const [compData, setCompData] = useState([]);
  const [aplCertData, setAplCertData] = useState([]);
  const [compCertData, setCompCertData] = useState([]);
  const [QnAData, setQnAData] = useState([]);
  const [write, setwrite] = useState([]);

  //기념품 데이터 state 저장
  const fetchSouvApDT = async () => {
    setAplData(await souvAplDatas); // 비동기 처리기 때문에 아무리 해도 바로 처리되진 않음!
  };

  const fetchSouvPpDT = async () => {
    setPreData(await souvProcDatas);
  };

  const fetchSouvCpDT = async () => {
    setCompData(await souvCompDatas);
  };

  //공지 데이터 state 저장
  const fetchWriteDT = async () => {
    setwrite(await noticeDatas);
  };

  //인증서 데이터 state 저장
  const fetchCertApDT = async () => {
    setAplCertData(await certAplDatas);
  };

  const fetchCertCpDT = async () => {
    setCompCertData(await certCompDatas);
  };

  // 큐앤에이 state 저장
  const fetchQnA = async () => {
    setQnAData(await questDatas);
  };

  useEffect(() => {
      fetchWriteDT();
  },[write]); //빈 배열일땐 마운트 될 때마다만 실행

  useEffect(() => {
    fetchSouvApDT();
  },[applyData]);

  useEffect(() => {
    fetchSouvPpDT();
  },[predData]);

  useEffect(() => {
    fetchSouvCpDT();
  },[compData]);

  useEffect(() => {
    fetchCertApDT();
  },[aplCertData]);

  useEffect(() => {
    fetchCertCpDT();
  },[compCertData]);

  useEffect(() => {
    fetchQnA();
  },[QnAData]);


  return (
    
    <div className="App">
      <Routes>
        <Route path='/' element={
          <Home write = {write} applyData = {applyData} predData = {predData} compData = {compData} 
          aplCertData = {aplCertData} compCertData = {compCertData} QnAData = {QnAData}> </Home>}>
        </Route> {/*path는 라우팅 주소, element는 주로 컴포넌트*/}
        <Route path='/cert' element={<div><NavbarHead /> <Outlet /></div>}>
          <Route path='apply' element={<div><CertApply aplCertData = {aplCertData} /></div>} />
          <Route path='complete' element={<div><CertComp compCertData = {compCertData} /></div>} />
        </Route>
        <Route path='/souv' element={<div><NavbarHead /> <Outlet /></div>}>
          <Route path='apply' element={<div><SouvApply applyData = {applyData}/></div>} />
          <Route path='proc' element={<div><SouvProc predData = {predData} /></div>} />
          <Route path='complete' element={<div><SouvComp compData = {compData}/></div>} />
        </Route>
        <Route path='/notice/:id' element={<Notice write = {write}/>}></Route>
        <Route path='/waybill' element={<WaybillInfo />}></Route>
        <Route path='*' element={<div>404 NOT FOUND</div>}>ERROR</Route> {/*404 ERROR*/}
      </Routes>
    </div>
  );
}

export default App;
