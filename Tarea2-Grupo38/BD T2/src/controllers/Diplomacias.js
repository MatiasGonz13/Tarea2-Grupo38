import prisma from '../prismaClient.js'

const getDiplomacias = async (req, res) => {
    try {
        const diplomacias = await prisma.diplomacias.findMany()
        res.json(diplomacias)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener todos los registros de Diplomacias' })
    }
}

const getDiplomaciaById = async (req, res) => {
    try {
        const { id_reino_1, id_reino_2 } = req.params
        const diplomacia1 = await prisma.diplomacias.findFirst({
            where: { id_reino_1: Number(id_reino_1), id_reino_2: Number(id_reino_2) }
        })
        const diplomacia2 = await prisma.diplomacias.findFirst({
            where: { id_reino_1: Number(id_reino_2), id_reino_2: Number(id_reino_1) }
        })
        const diplomacia = diplomacia1 || diplomacia2
        if (diplomacia) {
            res.json(diplomacia)
        }
        else {
            res.status(404).json({ message: 'Diplomacia no encontrada' })
        }
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al obtener diplomacia por ids' })
    }
}

const createDiplomacia = async (req, res) => {
    try {
        const { id_reino_1, id_reino_2, es_aliado } = req.body
        const newDiplomacia = await prisma.diplomacias.create({
            data: { id_reino_1, id_reino_2, es_aliado }
        })
        res.json(newDiplomacia)
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al crear nueva diplomacia' })
    }
}

const updateDiplomacia = async (req, res) => {
    try {
        const { id_reino_1, id_reino_2 } = req.params
        const { es_aliado } = req.body
        const updatedDiplomacia1 = await prisma.diplomacias.updateMany({
            where: { id_reino_1: Number(id_reino_1), id_reino_2: Number(id_reino_2) },
            data: { es_aliado },
        })
        const updatedDiplomacia2 = await prisma.diplomacias.updateMany({
            where: { id_reino_1: Number(id_reino_2), id_reino_2: Number(id_reino_1) },
            data: { es_aliado },
        })
        const updatedDiplomacia = updatedDiplomacia1 || updatedDiplomacia2
        if (updatedDiplomacia) {
            res.json(updatedDiplomacia)
        }
        else {
            res.status(404).json({ message: 'Diplomacia no encontrada' })
        }
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al actualizar registro de diplomacia' })
    }
}

const deleteDiplomacia = async (req, res) => {
    try {
        const { id_reino_1, id_reino_2 } = req.params
        const deletedDiplomacia1 = await prisma.diplomacias.deleteMany({
            where: { id_reino_1: Number(id_reino_1), id_reino_2: Number(id_reino_2) },
        })
        const deletedDiplomacia2 = await prisma.diplomacias.deleteMany({
            where: { id_reino_1: Number(id_reino_2), id_reino_2: Number(id_reino_1) }
        })
        const deletedDiplomacia = deletedDiplomacia1 || deletedDiplomacia2
        if (deletedDiplomacia) {
            res.json(deletedDiplomacia)
        }
        else {
            res.status(404).json({ message: 'Diplomacia no encotrada' })
        }
    }
    catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Error al eliminar registro de diplomacia'})
    }
}

const DiplomaciasController = {
    getDiplomacias,
    getDiplomaciaById,
    createDiplomacia,
    updateDiplomacia,
    deleteDiplomacia
}

export default DiplomaciasController