const Koa = require('koa');
const app = new Koa();

app.use(async ctx => {
    ctx.body = "Hello world i";
});

app.listen(3000);
