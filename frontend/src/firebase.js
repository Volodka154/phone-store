import { initializeApp } from "firebase/app"
import { getStorage, ref } from "firebase/storage"

const firebaseConfig = {
  apiKey: "AIzaSyD71jjbcKALleySYsPQRsvAY3Gkr0R1trY",
  authDomain: "phone-stor-bdef7.firebaseapp.com",
  projectId: "phone-stor-bdef7",
  storageBucket: "phone-stor-bdef7.appspot.com",
  messagingSenderId: "736416639724",
  appId: "1:736416639724:web:cfe353632538b667f5d3c9"
}

const firebaseInit = initializeApp(firebaseConfig)
const storage = getStorage(firebaseInit)
const storageRef = ref(storage)
export { firebaseInit, storage, storageRef }
