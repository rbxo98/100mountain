import NavbarHead from "./navBar";
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import './home.css';
import { useState } from "react";

function Home() {
    let [tableValue] = useState([5,'무언가 오류가 있습니다.','김예은','2023.1.19',0]);

    return (
      <div>
        <NavbarHead />
        <div className="homepage">
            <Row style={{justifyContent:"space-between"}}>
                <Col xs={5}>
                    <h3>인증서 발급 현황</h3>
                    <Row className="homepage-row">   
                        <Col>
                            <TitleImages pre = "미발급" value = {10}/>
                            <TearBodys nowpre = "신청현황"/>
                        </Col>
                        <Col>
                            <TitleImages pre = "발급" value = {10}/>
                            <TearBodys nowpre = "발급현황"/>
                        </Col>
                    </Row>
                </Col>
                
                <Col xs={5}>
                    <h3>기념품 처리 현황</h3>
                    <Row className="homepage-row">
                        <Col>
                            <TitleImages pre = "신청" value = {10}/>
                            <TearBodys nowpre = "신청현황"/>
                        </Col>

                        <Col>
                            <TitleImages pre = "진행" value = {10}/>
                            <TearBodys nowpre = "진행현황"/>
                        </Col>

                        <Col>
                            <TitleImages pre = "완료" value = {10}/>
                            <TearBodys nowpre = "완료현황"/>
                        </Col>
                    </Row>
                </Col>
            </Row>
            
            <Row style={{justifyContent:"space-between"}}>
                <Col xs={5}>
                    <h3>Q&A 현황</h3>
                    <Row className="homepage-row">   
                        <Col>
                        <TitleImages pre = "미답변" value = {10}/>
                        </Col>
                        
                        <Col>
                            <TitleImages pre = "답변" value = {10}/>
                        </Col>
                        <Table id = "notice-table1">
                            <thead>
                                <tr >
                                    <th className="num">번호</th>
                                    <th className="td-title">제목</th>
                                    <th className="writer">글쓴이</th>
                                    <th className="date">작성일</th>
                                    <th className="counting">조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                {tableValue.map((a, i) => {
                                    return(
                                        <tr>
                                            <td >{tableValue[0]}</td>
                                            <td >{tableValue[1]}</td>
                                            <td >{tableValue[2]}</td>
                                            <td >{tableValue[3]}</td>
                                            <td >{tableValue[4]}</td>
                                        </tr>
                                    )
                                })}
                            </tbody>
                        </Table>
                    </Row>
                    
                </Col>
                
                <Col xs={5}>
                    <h3>공지사항</h3>
                    <Row className="homepage-row">
                        <Table id = "notice-table2">
                            <thead>
                                <tr>
                                    <th className="num">번호</th>
                                    <th className="td-title">제목</th>
                                    <th className="writer">글쓴이</th>
                                    <th className="date">작성일</th>
                                    <th className="counting">조회</th>
                                </tr>
                            </thead>
                            <tbody >
                                {tableValue.map((a, i) => {
                                    return(
                                        <tr>
                                            <td >{tableValue[0]}</td>
                                            <td >{tableValue[1]}</td>
                                            <td >{tableValue[2]}</td>
                                            <td >{tableValue[3]}</td>
                                            <td >{tableValue[4]}</td>
                                        </tr>
                                    )
                                })}
                            </tbody>
                        </Table>
                    </Row>
                </Col>
            </Row>
        </div>
        
      </div>
    );
  }


  const TearBodys = (props) => {
    return (
        <Table bordered>
            <thead>
                <tr>
                    <th style={{backgroundColor: "gainsboro"}}>{props.nowpre}</th>
                </tr>
            </thead>         
            <tbody>
                <tr>
                    <td>브론즈</td>
                </tr>
                <tr>
                    <td>실버</td>
                </tr>
                <tr>
                    <td>골드</td>
                </tr>
            </tbody>
        </Table>
    )
  }

  const TitleImages = (props) => {
    return(
        <>
            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
            <div style={{paddingBottom:"10px"}}>
                <h3 className = "checker">{props.pre}: {props.value}</h3>
            </div>
        </>
    )
  }

  export default Home;