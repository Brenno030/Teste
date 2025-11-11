const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
    try {
        if(req.user.role !== 'admin'){
            return res.status(403).json({message:'Permission denied'});
        } 
        next();
    } catch(error) {
        console.error (error);
        res.status(400).json({message:'invalid token'});
    }
};
