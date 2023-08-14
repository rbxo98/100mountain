import Button from 'react-bootstrap/Button';
import './css/waybill.css';
import { Form } from 'react-bootstrap';
import { useState } from 'react';
import {db, updateWaybill} from './../Db';

export function WaybillInfo () {
    const [waybillNum, waybillNumSet] = useState("");
    const nickName = new URLSearchParams(window.location.search).get("data"); //value

    return(
        <div className='info'>
            <Form onChange={(e) => waybillNumSet(e.target.value)}>
                <Form.Group className="mb-3" id='waybills'>
                    <Form.Label>운송장</Form.Label>
                    <Form.Control type="string" placeholder="운송장 번호를 입력하세요." />
                </Form.Group>
            </Form>
            <div className='set-button'> {/*div자체에 display 깔아주고 내용물 내용 지정해야 함.*/}
                <Button style={{width:"10%"}} svariant="primary" onClick={() => setWaybill(nickName,waybillNum)}>등록</Button>
            </div>
        </div>
    )

}

export const setWaybill = (name, data) => { //db로 전송할 것.
    console.log(name,data);
    updateWaybill(db, name, data); //data 갱신
}
