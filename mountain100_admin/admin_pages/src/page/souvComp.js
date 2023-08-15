import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import './css/cert.css'; // 일부 CSS 가져옴
import './css/souv.css';

function SouvComp(props) {

    return(
        <div>
            <div className='certTitle'>
                <h5>완료현황</h5>
            </div>
            <div id='search-div-souvC'>
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
                    <Table id = "souvComp-table">
                        <thead>
                            <tr>
                                <th id="num-sc">번호</th>
                                <th id="name-sc">이름</th>
                                <th id="address-sc">주소</th>
                                <th id="tel-sc">연락처</th>
                                <th id="waybill-sc">운송장</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                props.compData ? props.compData.map((a, i) => {
                                    return(
                                        <tr style={{verticalAlign:"middle"}}> 
                                            <td >{i+1}</td>
                                            <td >{props.compData[i].name}</td>
                                            <td >{props.compData[i].address}</td>
                                            <td >{props.compData[i].tel}</td>
                                            <td >{props.compData[i].waybill}</td>
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


export default SouvComp;