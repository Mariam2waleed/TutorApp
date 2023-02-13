const fs = require('fs');
const http = require('http');
const url = require('url');

// ///////////////////////////////////////////////////
// -----------files----------------------------------
// const hello = ' mariam hello'
// console.log(hello);

// /----- Blocking, synchronous -----
// //read from file
// const textIn = fs.readFileSync('./txt/input.txt', 'utf-8');
// console.log(textIn);

// //write in to file
// const textOut = ` ffff: ${textIn}.\n created on ${Date.now()} `;
// fs.writeFileSync('./txt/output.txt', textOut);
// console.log('file written');

// /----- Non-Blocking, Asynchronous -----
// fs.readFile('./txt/start.txt', 'utf-8', (err, data1) => {
//     if (err) return console.log(' Error! ')

//     fs.readFile(`./txt/${data1}.txt`, 'utf-8', (err, data2) => {
//         console.log(data2);
//         fs.readFile(`./txt/append.txt`, 'utf-8', (err, data3) => {
//             console.log(data3);

//             fs.writeFile('./txt/final.txt', `${data2}\n${data3}`, 'utf-8', err => {
//                 console.log('your life is fucked ');
//             })
//         });

//     });
// });
// console.log('will read file!');


// ///////////////////////////////////////////////////
// -----------Server----------------------------------
const server = http.createServer((req, res) => {
    console.log(req.url);

    const pathName = req.url; 
    if(pathName === '/' || pathName ==='/overview') {
        res.end('this is overview');
    }else if (pathName === '/product') { 
        res.end ('tihs is PRODUCT')
    }else if (pathName === '/api') {
        fs.readFile('./dev-data/data.json')
        res.end ('tihs is API')
    } else { 
        res.writeHead(404, {
            'Content-type': 'text/html',
            'my-own-header': 'hello-mariam'
        });
        res.end('<h1>Page not found!</h1>');
    }
});

server.listen(8000, '127.0.0.1', () => {
    console.log('Listening to you bitch on 8000');
});

// ///////////////////////////////////////////////////
// -----------url----------------------------------
