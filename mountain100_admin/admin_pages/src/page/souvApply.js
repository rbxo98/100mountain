import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import './css/cert.css'; // 일부 CSS 가져옴
import './css/souv.css';

function SouvApply(props) {
    return(
        <div>
            <div className='certTitle'>
                <h5>신청현황</h5>
            </div>
            <div id='search-div-souvA'>
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
                    <Table id = "souvApl-table">
                        <thead>
                            <tr>
                                <th id="num-sa">번호</th>
                                <th id="name-sa">이름</th>
                                <th id="address-sa">주소</th>
                                <th id="tel-sa">연락처</th>
                                <th id="waybill-sa">운송장</th>
                                <th id="ap-button-sa"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {props.applyData ? props.applyData.map((a, i) => {
                                return(
                                    <tr style={{verticalAlign:"middle"}}> 
                                        <td >{i+1}</td>
                                        <td >{props.applyData[i].name}</td>
                                        <td >{props.applyData[i].address}</td>
                                        <td >{props.applyData[i].tel}</td>
                                        <td >{props.applyData[i].waybill}</td>
                                        <td ><Button  variant="primary" onClick={() => PopupWaybillWindow(props.applyData[i].nickname)}>배달하기</Button></td>
                                        {/*해당 url로 nickname 전달*/}
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

const PopupWaybillWindow = (nickname) => {
        const url = `/waybill?data=${nickname}`;
        window.open(url,"_black", "width=700, height=200, left=30, top=30, scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
    }

export default SouvApply;