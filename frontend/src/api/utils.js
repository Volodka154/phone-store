const get = async (url, headers = null)=>{
    try {
        const response = await fetch(url, headers);
        const data = await response.json();
        return data;
    } catch (e) {
        return e
    }
}