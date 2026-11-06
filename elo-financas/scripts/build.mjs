import fs from 'node:fs/promises';
import path from 'node:path';
const types={'.html':'text/html','.css':'text/css','.js':'text/javascript','.svg':'image/svg+xml','.png':'image/png','.woff2':'font/woff2','.ttf':'font/ttf','.json':'application/json'};
const assets={};
async function collect(dir){for(const item of await fs.readdir(dir,{withFileTypes:true})){const full=path.join(dir,item.name);if(item.name.endsWith('.png.json'))continue;if(item.isDirectory()){await collect(full);continue}const key='/'+path.relative('public',full).split(path.sep).join('/'),ext=path.extname(full),binary=['.png','.woff2','.ttf'].includes(ext);assets[key]={body:await fs.readFile(full,binary?'base64':'utf8'),type:types[ext]||'application/octet-stream',encoding:binary?'base64':'text'};}}
await collect('public');
await fs.rm('dist',{recursive:true,force:true});
await fs.mkdir('dist/server',{recursive:true});
await fs.mkdir('dist/.openai',{recursive:true});
const code=await fs.readFile('server/app.mjs','utf8');
await fs.writeFile('dist/server/index.js','const ASSETS = '+JSON.stringify(assets)+';\n'+code+'\nexport default {fetch:(req,env,ctx)=>handle(req,env,ctx,ASSETS)};\n');
await fs.copyFile('.openai/hosting.json','dist/.openai/hosting.json');
await fs.cp('drizzle','dist/drizzle',{recursive:true});
console.log('Built RaiNexa Worker with '+Object.keys(assets).length+' public assets and D1 migrations.');
