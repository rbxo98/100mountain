import { initializeApp } from 'firebase/app';
import { getFirestore, collection, query, where, getDocs, snapshot, doc, updateDoc } from 'firebase/firestore';

const firebaseConfig = {
  apiKey: process.env.REACT_APP_APIKEY,
  authDomain: process.env.REACT_APP_AUTH_DOMAIN,
  projectId: process.env.REACT_APP_PROJECT_ID,
  storageBucket: process.env.REACT_APP_STORAGE_BUCKET,
  messagingSenderId: process.env.REACT_APP_MESSAGING_SENDER_ID,
  appId: process.env.REACT_APP_APP_ID,
  measurementId: process.env.REACT_APP_MEASUREMENT_ID
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);



const getnotice = async (db) => {
  const noticeCol = collection(db, 'Notice');
  const Snapshot = await getDocs(noticeCol);
  const noticeList = Snapshot.docs.map(doc => doc.data());
  return noticeList;
}

const getSouvApl = async (db) => {
  const q = query(collection(db, "Souv"), where("info", "==", "신청함")); //쿼리로 info : 신청함이 맞는것만 검색
  const querySnapshot = await getDocs(q);
  /*querySnapshot.forEach((doc) => {
    // doc.data() is never undefined for query doc snapshots
    console.log(doc.id, " => ", doc.data());
  });*/
  const queryList = querySnapshot.docs.map(doc => doc.data());
  return queryList 
}

const getSouvProc = async (db) => {
  const q = query(collection(db, "Souv"), where("info", "==", "진행중")); //쿼리로 info : 신청함이 맞는것만 검색
  const querySnapshot = await getDocs(q);
  const queryList = querySnapshot.docs.map(doc => doc.data());
  return queryList 
}

const getSouvComp = async (db) => {
  const q = query(collection(db, "Souv"), where("info", "==", "완료")); //쿼리로 info : 신청함이 맞는것만 검색
  const querySnapshot = await getDocs(q);
  const queryList = querySnapshot.docs.map(doc => doc.data());
  return queryList 
}

const getcertApl = async (db) => {
  const q = query(collection(db, "Cert"), where("state", "==", "미완료")); //쿼리로 info : 신청함이 맞는것만 검색
  const querySnapshot = await getDocs(q);
  const queryList = querySnapshot.docs.map(doc => doc.data());
  return queryList 
}

const getcertComp = async (db) => {
  const q = query(collection(db, "Cert"), where("state", "==", "완료")); //쿼리로 info : 신청함이 맞는것만 검색
  const querySnapshot = await getDocs(q);
  const queryList = querySnapshot.docs.map(doc => doc.data());
  return queryList 
}

const getQnA = async (db) => {
  const QuestCol = collection(db, 'Quest');
  const Snapshot = await getDocs(QuestCol);
  const QuestList = Snapshot.docs.map(doc => doc.data());
  return QuestList;
}


export const updateWaybill = async (db, DocName, value) => {
  const waybillRef = doc(db, "Souv", DocName);

  // Set the "capital" field of the city 'DC'
  await updateDoc(waybillRef, {
    waybill: value,
    info : "진행중"
  });
}


export const noticeDatas = getnotice(db); //관련된 함수나 변수는 꼬옥 아래에 놓기 !!!중요!!!
export const souvAplDatas = getSouvApl(db); // 기념품 신청
export const souvProcDatas = getSouvProc(db); // 기념품 진행
export const souvCompDatas = getSouvComp(db); // 기념품 완료
export const certAplDatas = getcertApl(db);
export const certCompDatas = getcertComp(db);
export const questDatas = getQnA(db);