const reportForm = document.querySelector('.report-form')
const currentLog = document.querySelector('#current-log')
const contentHistory = document.querySelector('.content-history')


function renderLogs(lastLog) { // this is the render function
    console.log(lastLog)
    return `
        <article>
            <sub> ${lastLog.timestamp}</sub>
            <p> ${lastLog.content}</p>
        </article>
    `
    
}

function createLog() {
    let path = window.location.pathname
    let reportId = Number(path.split('/').pop())

    axios.post(`/api/reports/${reportId}/logs`, { content: currentLog.value } ).then(res => {
        console.log(res.data) 

        //this is grabbbing the reports
        axios.get('/api/reports').then(res => {
            console.log(res.data)

            contentHistory.innerHTML = renderLogs(res.data.pop())
            // this is grabbing the last log entry (rn only one user can use the app at a single time bc i cant figure out how to grab the last entry FROM a specifc report_id)
            // this is taking the data response from the axios.get call and sending it to the render function
        })
    })
    currentLog.value = ''
}

function handleSubmit(e) {
    e.preventDefault()
    clearInterval(currentTimer)
    currentTimer = setInterval(createLog, 60 * 10000)
    createLog()

}

reportForm.addEventListener('submit', handleSubmit)
currentTimer = setInterval(createLog, 60 * 10000)
