import Button from 'react-bootstrap/Button';
import './css/waybill.css';

function WaybillInfo () {
    return(
        <div className='info'>
            <Button variant="primary" onClick={windowOff}>둥록</Button>
        </div>
    )

}

const windowOff = () => {
    window.close();
}

export default WaybillInfo;