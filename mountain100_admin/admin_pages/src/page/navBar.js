import { useNavigate } from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import 'bootstrap/dist/css/bootstrap.min.css';
import '../App.css';
import './home.css';

let NavbarHead = () => {
    let navigate = useNavigate();
    return (
        <>
            <Navbar bg="dark" data-bs-theme="dark"  expand="lg" className="bg-body-tertiary">
                <Container style={{marginLeft:"10px"}}>
                    <Navbar.Brand href="/">100대 명산</Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <Nav.Link onClick={()=>{navigate('/')}}>Home</Nav.Link>
                            <NavDropdown title="인증서 신청관리" id="basic-nav-dropdown" data-bs-theme="light">
                                <NavDropdown.Item onClick={()=>{navigate('/cert/apply')}}>발급</NavDropdown.Item>
                                <NavDropdown.Item onClick={()=>{navigate('/cert/complete')}}>미발급</NavDropdown.Item>
                            </NavDropdown>
                            <NavDropdown title="기념품 신청관리" id="basic-nav-dropdown" data-bs-theme="light">
                                <NavDropdown.Item onClick={()=>{navigate('/souv/apply')}}>신청</NavDropdown.Item>
                                <NavDropdown.Item onClick={()=>{navigate('/souv/proc')}}>
                                    진행중
                                </NavDropdown.Item>
                                <NavDropdown.Item onClick={()=>{navigate('/souv/complete')}}>진행완료</NavDropdown.Item>
                            </NavDropdown>
                            <Nav.Link onClick={()=>{navigate('/notice')}}>공지사항</Nav.Link>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    )

};

export default NavbarHead;