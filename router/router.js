const express = require('express');
const router = express.Router();
const UrlController = require('../controller/urlController')


/**
 * @swagger
 * /GetAllUrls:
 *  get:
 *    description: Returns the last 10 URLs in json version
 *    responses:
 *      '200':
 *        description: A successful response
 */
router.get('/GetAllUrls', UrlController.GetAllUrls)
/**
 * @swagger
 * /TopLikes:
 *  get:
 *    description: Use to request all Urls
 *    responses:
 *      '200':
 *        description: A successful response
 */
router.get('/TopLikes', UrlController.TopLikes)
/**
 * @swagger
 * /CreateUrls:
 *    post:
 *      description: Add a new URL to the database
 *    parameters:
 *      - name: Url
 *        in: query
 *        description: Url link
 *        required: false
 *        schema:
 *          type: string
 *          format: string
 *    responses:
 *      '200':
 *        description: A successful response
 *      '500':
 *         descroption: Server error
 */
router.post('/CreateUrls', UrlController.CreateNewUrl)
/**
 * @swagger
 * /LikeUrl:
 *    post:
 *      description: Like url
 *    parameters:
 *      - name: Url
 *        in: query
 *        description: Url link
 *        required: false
 *        schema:
 *          type: string
 *          format: string
 *    responses:
 *      '200':
 *        description: A successful response
 *      '500':
 *         descroption: Server error
 */
router.post('/LikeUrl', UrlController.LikeUrl)

module.exports = router
