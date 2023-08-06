import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import { useState } from "react";
import './css/cert.css';
import { FormCheck } from 'react-bootstrap';


function CertApply(props) {
    
    return(
        <div>
            <div className='certTitle'>
                <h5>발급현황</h5>
            </div>
            <div id='search-div'>
                <Form className="d-flex">
                  <Form.Control
                    type="search"
                    placeholder="Search"
                    className="me-2"
                    aria-label="Search"
                  />
                  <Button variant="outline-dark">Search</Button>
                </Form>
            </div>
            <Row>
                <Col>
                    <Table id = "certAp-table">
                        <thead>
                            <tr>
                                <th id="ch-box"><FormCheck /></th>
                                <th id="user-name">신청자명</th>
                                <th id="tears">등급</th>
                                <th id="cer-date">신청일</th>
                                <th id="ap-button"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                props.aplCertData ? props.aplCertData.map((a, i) => {
                                    let certDate = props.aplCertData[i].date.toDate().toDateString();
                                    return(
                                        <tr style={{verticalAlign:"middle"}}> 
                                            <td><FormCheck /></td>
                                            <td >{props.aplCertData[i].name}</td>
                                            <td >{props.aplCertData[i].grade}</td>
                                            <td >{certDate}</td>
                                            <td ><Button variant="link" >발급하기</Button></td>
                                        </tr>
                                    )
                                }) : ""
                            }
                        </tbody>
                    </Table>
                </Col>
            </Row>
            
        </div>

    )
}


export default CertApply;