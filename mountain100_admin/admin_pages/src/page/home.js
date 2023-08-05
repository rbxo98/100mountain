import NavbarHead from "./navBar";
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import './css/home.css';
import { useState, useEffect } from "react";

function Home(props) {
    let [tableQVal] = useState([1,2,3]);

    return (
      <div>
        <NavbarHead />
        <div className="homepage" >
            <Row style={{justifyContent:"space-between"}}>
                <Col xs={5}>
                    <h3>인증서 발급 현황</h3>
                    <Row className="homepage-row">  
                        <Col>
                            <TitleImages2 pre = "미발급" value = {props.aplCertData} name="x.png"/>
                            <TearBodys nowpre = "신청현황"/>
                        </Col>
                        <Col>
                            <TitleImages2 pre = "발급" value = {props.compCertData} name="circle.png"/>
                            <TearBodys nowpre = "발급현황"/>
                        </Col>
                    </Row>
                </Col>
                
                <Col xs={5}>
                    <h3>기념품 처리 현황</h3>
                    <Row className="homepage-row">
                        <Col>
                            <TitleImages3 pre = "신청" value = {props.applyData} name="apply.png"/>
                            <TearBodys nowpre = "신청현황"/>
                        </Col>

                        <Col>
                            <TitleImages3 pre = "진행" value = {props.predData} name="pred.png"/>
                            <TearBodys nowpre = "진행현황"/>
                        </Col>

                        <Col>
                            <TitleImages3 pre = "완료" value = {props.compData} name="finish.png"/>
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
                        <TitleImages2 pre = "미답변" value = {10} name="x.png"/>
                        </Col>
                        
                        <Col>
                            <TitleImages2 pre = "답변" value = {10} name="circle.png"/>
                        </Col>
                        <Table id = "notice-table1">
                            <thead>
                                <tr>
                                    <th className="num">번호</th>
                                    <th className="td-title">제목</th>
                                    <th className="writer">글쓴이</th>
                                    <th className="date">작성일</th>
                                    <th className="counting">조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                {tableQVal.map((a, i) => {
                                    return(
                                        <tr style={{verticalAlign:"middle"}}>
                                            <td >{i}</td>
                                            <td >{i}</td>
                                            <td >{i}</td>
                                            <td >{i}</td>
                                            <td >{i}</td>
                                        </tr>
                                    )
                                })}
                            </tbody>
                        </Table>
                    </Row>
                    
                </Col>
                
                <Col xs={5}>
                    <h3 style={{paddingTop:"10px"}}>공지사항</h3>
                    <Row className="homepage-row">
                        <Table id = "notice-table2">
                            <thead>
                                <tr style={{verticalAlign:"middle"}}>
                                    <th className="num">번호</th>
                                    <th className="td-title">제목</th>
                                    <th className="writer">글쓴이</th>
                                    <th className="date">작성일</th>
                                    <th className="counting">조회</th>
                                </tr>
                            </thead>
                            <tbody >
                                {
                                    props.write ? props.write.map((a, i) => {
                                        return(
                                            <tr style={{verticalAlign:"middle"}}>
                                                <td >{i}</td>
                                                <td >{props.write[i].title}</td>
                                                <td >{props.write[i].writer}</td>
                                                <td >{props.write[i].date}</td>
                                                <td >{props.write[i].views}</td>
                                            </tr>
                                        )
                                    
                                    }): ""
                                }
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
        <Table bordered style={{display:"table"}}>
            <thead>
                <tr>
                    <th style={{backgroundColor: "gainsboro", verticalAlign:"middle"}}>{props.nowpre}</th>
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

  const TitleImages3 = (props) => {
    return(
        <>
            <img className="images_3" src={`${process.env.PUBLIC_URL}/img/${props.name}`}/>
            <div style={{paddingBottom:"10px"}}>
                <h3 className = "checker">{props.pre}: {props.value}</h3>
            </div>
        </>
    )
  }

  const TitleImages2 = (props) => {
    return(
        <>
            <img className="images_2" src={`${process.env.PUBLIC_URL}/img/${props.name}`}/>
            <div style={{paddingBottom:"10px"}}>
                <h3 className = "checker">{props.pre}: {props.value}</h3>
            </div>
        </>
    )
  }

  export default Home;