--1. What grades are stored in the database?
--SELECT	Grade.Name as GradeLevel
--From	Grade;

--2.  What emotions may be associated with a poem?
--select	Emotion.Name as Emotion
--from	Emotion;

--3.  How many poems are in the database?
--select	count(Poem.Id)
--from	Poem;

--4.  Sort authors alphabetically by name. What are the names of the top 76 authors?
--select	top 76 Author.Name 
--from	Author
--order by	Author.Name;

--5.  Starting with the above query, add the grade of each of the authors.
--select	top 76 Author.Name, Author.GradeId
--from	Author
--join	Grade on Author.GradeId = Grade.id
--order by	Author.Name;

--6.  Starting with the above query, add the recorded gender of each of the authors.
--select	top 76 Author.Name, Grade.Name as Grade, Gender.Name as Gender
--from	Author
--join	Grade on Author.GradeId = Grade.id
--join	Gender on Author.GenderId = Gender.id
--order by	Author.Name;

--7.  What is the total number of words in all poems in the database?
--select	sum(Poem.WordCount)
--from	Poem

--8. Which poem has the fewest characters?
--select	Poem.Title, Poem.CharCount
--from	Poem
--where	Poem.CharCount = (
--SElect min(Poem.CharCount)
--from	Poem);

--9. How many authors are in the third grade?
--select	count(Author.Name)
--from	Author
--JOIN	Grade on GradeId = Grade.id
--where	Grade.id = 3;

--10. How many authors are in the first, second or third grades?
--select	count(Author.Name)
--from	Author
--JOIN	Grade on GradeId = Grade.id
--where	Grade.id = 3 or Grade.id = 2 or Grade.id = 1;

----11. What is the total number of poems written by fourth graders?
--select	count(Poem.Id)
--from	Poem
--join	Author on AuthorId = Author.id
--join	Grade on GradeId = Grade.id
--where	Grade.id = 4

--12. How many poems are there per grade?
--select	count(Poem.Id) as PoemsByGrade
--from	Poem
--join	Author on AuthorId = Author.id
--join	Grade on GradeId = Grade.id
--group by GradeId

--13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--select Grade.Name, count(Author.Id) as TotalAuthors
--from	Author
--join	Grade on GradeId = Grade.id
--where	GradeId = 1 or GradeId = 2 or GradeId = 3 or GradeId = 4 or GradeId = 5
--group by	Grade.Name

--14. What is the title of the poem that has the most words?
--select	poem.title, poem.wordcount
--from	poem
--where	poem.wordcount = (
--select max(poem.wordcount)
--from	poem);

--15. Which author(s) have the most poems? (Remember authors can have the same name.)
--select	Author.Name as Author, count(Poem.Id) as NumOfPoems
--from	Author
--join	Poem on Author.Id = Poem.AuthorId
--group by	Poem.AuthorId, Author.Name
--order by	NumOfPoems desc


--16. How many poems have an emotion of sadness? (This method lists all 4 emotions and counts)
select	 Name, count(Poem.Id)
from	PoemEmotion
join	Emotion on Emotion.Id = PoemEmotion.EmotionId
join	Poem on Poem.Id = PoemEmotion.PoemId
group by Name
--where	Emotion.Id = 3

--17. How many poems are not associated with any emotion?
select	 Name, count(Poem.Id)
from	Poem
left join	PoemEmotion on PoemEmotion.PoemId = Poem.Id
left join	Emotion on Emotion.Id = PoemEmotion.EmotionId
group by	Name
--having		Name IS NULL


--18. Which emotion is associated with the least number of poems?


--19. Which grade has the largest number of poems with an emotion of joy?
--20. Which gender has the least number of poems with an emotion of fear?

