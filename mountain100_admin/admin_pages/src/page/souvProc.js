import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import { useState } from "react";
import './css/cert.css'; // 일부 CSS 가져옴
import './css/souv.css';

function SouvProc(props) {

    return(
        <div>
            <div className='certTitle'>
                <h5>진행현황</h5>
            </div>
            <div id='search-div-souvP'>
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
                    <Table id = "souvProc-table">
                        <thead>
                            <tr>
                                <th id="num-sp">번호</th>
                                <th id="name-sp">이름</th>
                                <th id="address-sp">주소</th>
                                <th id="tel-sp">연락처</th>
                                <th id="waybill-sp">운송장</th>
                                <th id="ap-button-sp"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                props.predData ? props.predData.map((a, i) => {
                                    let deliveryDate = props.predData[i].date.toDate().toDateString();
                                    console.log(deliveryDate)
                                    return(
                                        <tr style={{verticalAlign:"middle"}}> 
                                            <td >{i+1}</td>
                                            <td >{props.predData[i].name}</td>
                                            <td >{props.predData[i].address}</td>
                                            <td >{props.predData[i].tel}</td>
                                            <td >{props.predData[i].waybill}</td>
                                            <td ><Button onClick={() => {PopupDeliveryWindow(props.predData[i].nickname, props.predData[i].waybill, deliveryDate)}}variant="primary">운송현황</Button></td>
                                        </tr>
                                    )
                                }): null
                           }
                        </tbody>
                    </Table>
                </Col>
            </Row>
        </div>
    )
}

const PopupDeliveryWindow = (nickname,waybill,date) => {
    const url = `/Delivery?data=${[nickname,waybill,date]}`;
    window.open(url,"_black", "width=700, height=250, left=30, top=30, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
}

export default SouvProc;