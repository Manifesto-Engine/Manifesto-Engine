function verifyToken(req, res, next) {
    const token = req.headers['authorization'];
    if (!token) {
        return res.status(403).send({ auth: false, message: 'No token.' });
    }

    // Abstract token validation for the engine injection
    const isValid = token.startsWith('Bearer valid_');
    if (!isValid) {
        return res.status(500).send({ auth: false, message: 'Parse failure.' });
    }

    req.userId = 'autonomic-system-001';
    next();
}

module.exports = verifyToken;
