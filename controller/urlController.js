const { Url, Voting, sequelize } = require('../model/db')

class UrlController {
    //require{url}
    async CreateNewUrl(req, res) {
        try {
            await Url.findOne({
                where: {
                    url: req.body.url
                }
            }).then(async r => {
                if (r) {
                    res.status(200).send('Url already used')
                } else {
                    Url.create(req.body)
                    res.status(200).send("OK")
                }
            })
        } catch (error) {
            res.status(500).send({
                error: 'oop something went wrong'
            })
        }
    }

    async GetAllUrls(req, res) {
        try {
            let temp = []
            const urls = await Url.findAll({
                order: [['id', 'DESC']],
                limit: 10
            })
            urls.forEach(item => {
                temp.push(item.url)
            })
            res.status(200).send({ urls: temp })
        } catch (error) {
            res.status(500).send({
                error: 'oop something went wrong'
            })
        }
    }

    //require{url}
    async LikeUrl(req, res) {
        try {
            await Url.findOne({
                where: {
                    url: req.body.url
                }
            }).then(async r => {
                if (r) {
                    await Voting.findOne({
                        where: {
                            urlId: r.dataValues.id
                        }
                    }).then(async k => {
                        if (k) {
                            let likes = k.like
                            Voting.update({ like: likes + 1 }, { where: { urlId: k.urlId } })
                            res.status(200).send('OK')
                        } else {
                            let temp = {
                                urlId: r.id
                            }
                            Voting.create(temp)
                            res.status(200).send('OK')
                        }
                    })
                } else {
                    res.status(404).send('Url Not Found')
                }
            })
        } catch (error) {
            res.status(500).send({
                error: 'oop something went wrong'
            })
        }
    }

    async TopLikes(req, res) {
        try {
            const TopLikes = await Voting.findAll({
                order: [['like', 'DESC']],
                limit: 10
            })
            res.status(200).send(TopLikes)
        } catch (error) {
            res.status(500).send({
                error: 'oop something went wrong'
            })
        }
    }
}

module.exports = new UrlController()