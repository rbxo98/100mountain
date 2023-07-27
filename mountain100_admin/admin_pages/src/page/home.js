import NavbarHead from "./navBar";
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import './home.css';

function Home() {

    return (
      <div>
        <NavbarHead />
        <div className="homepage">
            <Row style={{justifyContent:"space-between"}}>
                <Col xs={4}>
                    <h3>인증서 발급 현황</h3>
                    <Row className="homepage-row">   
                        <Col>
                            <img className ="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                            <thead>
                                <tr>
                                    <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                </tr>
                            </tbody>
                            </Table>
                        </Col>
                        
                        <Col>
                            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                                <thead>
                                    <tr>
                                        <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </Col>
                    </Row>
                </Col>
                
                <Col xs={5}>
                    <h3>기념품 처리 현황</h3>
                    <Row className="homepage-row">
                        <Col>
                            <img className ="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                            <thead>
                                <tr>
                                    <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                </tr>
                            </tbody>
                            </Table>
                        </Col>

                        <Col>
                            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                                <thead>
                                    <tr>
                                        <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </Col>

                        <Col>
                            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                                <thead>
                                    <tr>
                                        <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </Col>
                    </Row>
                </Col>
            </Row>
            <Row style={{justifyContent:"space-between"}}>
                <Col xs={4}>
                    <h3>인증서 발급 현황</h3>
                    <Row className="homepage-row">   
                        <Col>
                            <img className ="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                            <thead>
                                <tr>
                                    <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                </tr>
                            </tbody>
                            </Table>
                        </Col>
                        
                        <Col>
                            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                                <thead>
                                    <tr>
                                        <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </Col>
                    </Row>
                </Col>
                
                <Col xs={5}>
                    <h3>기념품 처리 현황</h3>
                    <Row className="homepage-row">
                        <Col>
                            <img className ="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                            <thead>
                                <tr>
                                    <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                </tr>
                            </tbody>
                            </Table>
                        </Col>

                        <Col>
                            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                                <thead>
                                    <tr>
                                        <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </Col>

                        <Col>
                            <img className="images" src="https://t1.kakaocdn.net/friends/prod/character/character_20221226084804_cb844dd7630a4c9b84f7971f9563b7d1.png" />
                            <div style={{paddingBottom:"10px"}}>
                                <h3 className = "checker">미발급: 10</h3>
                            </div>
                            <Table bordered>
                                <thead>
                                    <tr>
                                        <th style={{backgroundColor: "gainsboro"}}>신청현황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </Col>
                    </Row>
                </Col>
            </Row>
        </div>
        
      </div>
    );
  }

  export default Home;