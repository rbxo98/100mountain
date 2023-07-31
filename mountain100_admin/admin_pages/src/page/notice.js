import Pagination from 'react-bootstrap/Pagination';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import { useState } from "react";
import NavbarHead from './navBar';
import './notice.css';
import { useParams } from 'react-router-dom';


function Notice() {
    let [tableVal] = useState([5,'무언가 오류가 있습니다.','김예은','2023.1.19',0]);
    let {id} = useParams();
    return (
        <div>
            <NavbarHead />
            <div className="board_wrap">
                <div className="board_title">
                    <strong style={{fontSize:"2rem"}}>공지사항</strong>
                    <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
                </div>
                <Row>
                    <Col>
                        <Table id = "notice-table">
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
                                {tableVal.map((a, i) => {
                                    return(
                                        <tr>
                                            <td >1</td>
                                            <td >2</td>
                                            <td >3</td>
                                            <td >4</td>
                                            <td >5</td>
                                        </tr>
                                    )
                                })}
                            </tbody>
                        </Table>
                    </Col>
                        {/**나중에 id값에 따라서 추가하는거 집어넣어놓기. 데이터 받아온 이후에 진행 */}
                        <Pagination expand="lg" className='pag_custom'> {/** Item 옆에 active면 활성, disabled면 선택 불가능 */}
                            <Pagination.First />
                            <Pagination.Prev />

                            <Pagination.Item>{1}</Pagination.Item>
                            <Pagination.Item>{2}</Pagination.Item>
                            <Pagination.Item>{3}</Pagination.Item>
                            <Pagination.Item>{4}</Pagination.Item>
                            <Pagination.Item>{5}</Pagination.Item>

                            <Pagination.Next />
                            <Pagination.Last />
                        </Pagination> 
                </Row>
            </div>
        </div>

    )

}

export default Notice;