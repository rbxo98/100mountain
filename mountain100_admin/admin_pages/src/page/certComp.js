import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import { useState } from "react";
import './css/cert.css';
import { FormCheck } from 'react-bootstrap';

function CertComp(props) {
    
    return(
        <div>
            <div className='certTitle'>
                <h5>발급현황</h5>
            </div>
            <div id='search-div-com'>
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
                    <Table id = "certCom-table">
                        <thead>
                            <tr>
                                <th id="ch-box-c"><FormCheck /></th>
                                <th id="user-name-c">신청자명</th>
                                <th id="tears-c">등급</th>
                                <th id="cer-date-c">신청일</th>
                                <th id="ap-button-c"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                props.compCertData ? props.compCertData.map((a, i) => {
                                    let certDate = props.compCertData[i].date.toDate().toDateString();
                                    return(
                                        <tr style={{verticalAlign:"middle"}}> 
                                            <td><FormCheck /></td>
                                            <td >{props.compCertData[i].name}</td>
                                            <td >{props.compCertData[i].grade}</td>
                                            <td >{certDate}</td>
                                            <td ><Button variant="link">다운로드</Button></td>
                                        </tr>
                                    )
                                }) : null
                            }
                        </tbody>
                    </Table>
                </Col>
            </Row>
            
        </div>

    )
}

export default CertComp;