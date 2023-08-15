import Button from 'react-bootstrap/Button';
import './css/delivery.css';
import {db, updateSouvInfo} from './../Db';


export function Delivery() {
    const data = new URLSearchParams(window.location.search).get("data"); //value
    const [nickname, waybill, date] = data.split(',')
    console.log(data)

    return(
        <div className='delivery-Info'>
            <h4>발송 일자</h4>
            <p className='board-line'>{date}</p>
            <h4>운송장 번호</h4>
            <p>{waybill}</p>
            <div className='set-DeliveryButton'> {/*div자체에 display 깔아주고 내용물 내용 지정해야 함.*/}
                <Button style={{width:"10%"}} svariant="primary" onClick={() => {setSouvComp(nickname)}} >완료</Button>
            </div>
        </div>
    )
}

export const setSouvComp = async(name) => { //db로 전송할 것.
    //console.log(name,data);
    const isOk = updateSouvInfo(db, name); //data 갱신
    console.log(isOk)
    if (await isOk) {
        window.close()
    }
}