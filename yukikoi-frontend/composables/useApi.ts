// 本地测试手动改成 http://127.0.0.1:8000/...，部署时直接使用相对路径 ✅
export async function getMessages() {
    const res = await fetch("/api/everwhispers/messages");
    //const res = await fetch("http://127.0.0.1:8000/api/everwhispers/messages");
    return await res.json();
}

export async function postMessage(formData: FormData) {
    const res = await fetch("/api/everwhispers/messages", {
        // const res = await fetch("http://127.0.0.1:8000/api/everwhispers/messages", {
        method: "POST",
        body: formData,
    });
    return await res.json();
}

export async function deleteMessage(id: string) {
    const res = await fetch("/api/everwhispers/${id}", {
        //const res = await fetch("http://127.0.0.1:8000/api/everwhispers/${id}", {
        method: "DELETE",
    });
    return await res.json();
}
