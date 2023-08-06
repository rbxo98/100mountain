import Button from 'react-bootstrap/Button';
import './css/waybill.css';
import { Form } from 'react-bootstrap';

function WaybillInfo () {
    return(
        <div className='info'>
            <Form>
                <Form.Group className="mb-3" id='waybills'>
                    <Form.Label>운송장</Form.Label>
                    <Form.Control type="number" placeholder="운송장 번호를 입력하세요." />
                </Form.Group>
            </Form>
            <div className='set-button'> {/*div자체에 display 깔아주고 내용물 내용 지정해야 함.*/}
                <Button style={{width:"10%"}} svariant="primary" onClick={windowOff}>둥록</Button>
            </div>
        </div>
    )

}



const windowOff = () => {
    const bills = document.getElementsByTagName('waybills');
    console.log(bills);
    window.close();
    return bills;
}

export default WaybillInfo;